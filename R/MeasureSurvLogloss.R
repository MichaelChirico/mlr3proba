#' @template surv_measure
#' @templateVar title Log loss
#' @templateVar fullname MeasureSurvLogloss
#'
#' @description
#' Calculates the cross-entropy, or logarithmic (log), loss.
#'
#' The logloss, in the context of probabilistic predictions, is defined as the negative log
#' probability density function, \eqn{f}, evaluated at the observation time, \eqn{t},
#' \deqn{L(f, t) = -log(f(t))}
#'
#' The standard error of the Logloss, L, is approximated via,
#' \deqn{se(L) = sd(L)/\sqrt{N}}{se(L) = sd(L)/\sqrt N}
#' where \eqn{N} are the number of observations in the test set, and \eqn{sd} is the standard
#' deviation.
#'
#' The IPCW log loss is defined by
#' \deqn{L(f, t, \Delta) = -\Delta log(f(t))/G(t)}
#' where \eqn{\Delta} is the censoring indicator and G is the Kaplan-Meier estimator of the
#' censoring distribution.
#'
#' @template param_id
#' @template param_eps
#' @template param_se
#' @template details_trainG
#'
#' @family Probabilistic survival measures
#' @family distr survival measures
#' @export
MeasureSurvLogloss = R6::R6Class("MeasureSurvLogloss",
  inherit = MeasureSurv,
  public = list(
    #' @description
    #' Creates a new instance of this [R6][R6::R6Class] class.
    #' @param ERV (`logical(1)`)\cr
    #'   Standardize measure against a Kaplan-Meier baseline
    #'   (Explained Residual Variation)
    initialize = function(ERV = FALSE) {
      assert(check_logical(ERV))

      ps = ps(
        eps = p_dbl(0, 1, default = 1e-15),
        se = p_lgl(default = FALSE),
        IPCW = p_lgl(default = TRUE),
        ERV = p_lgl(default = FALSE)
      )
      ps$values = list(eps = 1e-15, se = FALSE, IPCW = TRUE, ERV = ERV)

      range = if (ERV) c(-Inf, 1) else c(0, Inf)

      super$initialize(
        id = "surv.logloss",
        range = range,
        minimize = !ERV,
        predict_type = "distr",
        packages = "distr6",
        label = "Log Loss",
        man = "mlr3proba::mlr_measures_surv.logloss",
        param_set = ps
      )

      invisible(self)
    }
  ),

  private = list(
    .score = function(prediction, task, train_set, ...) {
      if (self$param_set$values$ERV) {
        return(.scoring_rule_erv(self, prediction, task, train_set))
      }
      x = as.integer(!is.null(task)) + as.integer(!is.null(train_set))
      if (x == 1) {
        stop("Either 'task' and 'train_set' should be passed to measure or neither.")
      } else if (x) {
        train = task$truth(train_set)
      } else {
        train = NULL
      }

      ps = self$param_set$values

      if (ps$se) {
        ll = surv_logloss(prediction$truth, prediction$distr, ps$eps, ps$IPCW, train)
        sd(ll) / sqrt(length(ll))
      } else {
        mean(surv_logloss(prediction$truth, prediction$distr, ps$eps, ps$IPCW, train))
      }
    }
  )
)
