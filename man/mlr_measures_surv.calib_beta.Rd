% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeasureSurvCalibrationBeta.R
\name{mlr_measures_surv.calib_beta}
\alias{mlr_measures_surv.calib_beta}
\alias{MeasureSurvCalibrationBeta}
\title{Van Houwelingen's Beta Survival Measure}
\description{
This calibration method fits the predicted linear predictor from a Cox PH model as the only
predictor in a new Cox PH model with the test data as the response.
\deqn{h(t|x) = h_0(t)exp(l\beta)}
where \eqn{l} is the predicted linear predictor.

The model is well calibrated if the estimated \eqn{\beta} coefficient is equal to 1.

Assumes fitted model is Cox PH.
}
\section{Dictionary}{

This \link[mlr3:Measure]{Measure} can be instantiated via the \link[mlr3misc:Dictionary]{dictionary}
\link[mlr3:mlr_measures]{mlr_measures} or with the associated sugar function \link[mlr3:mlr_sugar]{msr()}:

\if{html}{\out{<div class="sourceCode">}}\preformatted{MeasureSurvCalibrationBeta$new()
mlr_measures$get("surv.calib_beta")
msr("surv.calib_beta")
}\if{html}{\out{</div>}}
}

\section{Meta Information}{

\itemize{
\item Type: \code{"surv"}
\item Range: \eqn{(-\infty, \infty)}{(-Inf, Inf)}
\item Minimize: \code{FALSE}
\item Required prediction: \code{lp}
}
}

\references{
Van Houwelingen, C. H (2000).
\dQuote{Validation, calibration, revision and combination of prognostic survival models.}
\emph{Statistics in Medicine}, \bold{19}(24), 3401--3415.
\doi{10.1002/1097-0258(20001230)19:24<3401::AID-SIM554>3.0.CO;2-2}.
}
\seealso{
Other survival measures: 
\code{\link{mlr_measures_surv.calib_alpha}},
\code{\link{mlr_measures_surv.chambless_auc}},
\code{\link{mlr_measures_surv.cindex}},
\code{\link{mlr_measures_surv.dcalib}},
\code{\link{mlr_measures_surv.graf}},
\code{\link{mlr_measures_surv.hung_auc}},
\code{\link{mlr_measures_surv.intlogloss}},
\code{\link{mlr_measures_surv.logloss}},
\code{\link{mlr_measures_surv.mae}},
\code{\link{mlr_measures_surv.mse}},
\code{\link{mlr_measures_surv.nagelk_r2}},
\code{\link{mlr_measures_surv.oquigley_r2}},
\code{\link{mlr_measures_surv.rcll}},
\code{\link{mlr_measures_surv.rmse}},
\code{\link{mlr_measures_surv.schmid}},
\code{\link{mlr_measures_surv.song_auc}},
\code{\link{mlr_measures_surv.song_tnr}},
\code{\link{mlr_measures_surv.song_tpr}},
\code{\link{mlr_measures_surv.uno_auc}},
\code{\link{mlr_measures_surv.uno_tnr}},
\code{\link{mlr_measures_surv.uno_tpr}},
\code{\link{mlr_measures_surv.xu_r2}}

Other calibration survival measures: 
\code{\link{mlr_measures_surv.calib_alpha}},
\code{\link{mlr_measures_surv.dcalib}}

Other lp survival measures: 
\code{\link{mlr_measures_surv.chambless_auc}},
\code{\link{mlr_measures_surv.hung_auc}},
\code{\link{mlr_measures_surv.nagelk_r2}},
\code{\link{mlr_measures_surv.oquigley_r2}},
\code{\link{mlr_measures_surv.song_auc}},
\code{\link{mlr_measures_surv.song_tnr}},
\code{\link{mlr_measures_surv.song_tpr}},
\code{\link{mlr_measures_surv.uno_auc}},
\code{\link{mlr_measures_surv.uno_tnr}},
\code{\link{mlr_measures_surv.uno_tpr}},
\code{\link{mlr_measures_surv.xu_r2}}
}
\concept{calibration survival measures}
\concept{lp survival measures}
\concept{survival measures}
\section{Super classes}{
\code{\link[mlr3:Measure]{mlr3::Measure}} -> \code{\link[mlr3proba:MeasureSurv]{mlr3proba::MeasureSurv}} -> \code{MeasureSurvCalibrationBeta}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-MeasureSurvCalibrationBeta-new}{\code{MeasureSurvCalibrationBeta$new()}}
\item \href{#method-MeasureSurvCalibrationBeta-clone}{\code{MeasureSurvCalibrationBeta$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="aggregate"><a href='../../mlr3/html/Measure.html#method-Measure-aggregate'><code>mlr3::Measure$aggregate()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="format"><a href='../../mlr3/html/Measure.html#method-Measure-format'><code>mlr3::Measure$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="help"><a href='../../mlr3/html/Measure.html#method-Measure-help'><code>mlr3::Measure$help()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="Measure" data-id="score"><a href='../../mlr3/html/Measure.html#method-Measure-score'><code>mlr3::Measure$score()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3proba" data-topic="MeasureSurv" data-id="print"><a href='../../mlr3proba/html/MeasureSurv.html#method-MeasureSurv-print'><code>mlr3proba::MeasureSurv$print()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-MeasureSurvCalibrationBeta-new"></a>}}
\if{latex}{\out{\hypertarget{method-MeasureSurvCalibrationBeta-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureSurvCalibrationBeta$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-MeasureSurvCalibrationBeta-clone"></a>}}
\if{latex}{\out{\hypertarget{method-MeasureSurvCalibrationBeta-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{MeasureSurvCalibrationBeta$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
