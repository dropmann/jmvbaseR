
# This file is automatically generated, you probably don't want to edit this

correlationOptions <- if (requireNamespace('jmvcore')) R6::R6Class(
    "correlationOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            x = NULL,
            y = NULL,
            alternative = "two.sided",
            method = "pearson",
            conf.level = 0.95, ...) {

            super$initialize(
                package='jmvbaseR',
                name='correlation',
                requiresData=TRUE,
                ...)

            private$..x <- jmvcore::OptionVariable$new(
                "x",
                x)
            private$..y <- jmvcore::OptionVariable$new(
                "y",
                y)
            private$..alternative <- jmvcore::OptionList$new(
                "alternative",
                alternative,
                options=list(
                    "two.sided",
                    "less",
                    "greater"),
                default="two.sided")
            private$..method <- jmvcore::OptionList$new(
                "method",
                method,
                options=list(
                    "pearson",
                    "kendall",
                    "spearman"),
                default="pearson")
            private$..conf.level <- jmvcore::OptionNumber$new(
                "conf.level",
                conf.level,
                default=0.95)

            self$.addOption(private$..x)
            self$.addOption(private$..y)
            self$.addOption(private$..alternative)
            self$.addOption(private$..method)
            self$.addOption(private$..conf.level)
        }),
    active = list(
        x = function() private$..x$value,
        y = function() private$..y$value,
        alternative = function() private$..alternative$value,
        method = function() private$..method$value,
        conf.level = function() private$..conf.level$value),
    private = list(
        ..x = NA,
        ..y = NA,
        ..alternative = NA,
        ..method = NA,
        ..conf.level = NA)
)

correlationResults <- if (requireNamespace('jmvcore')) R6::R6Class(
    inherit = jmvcore::Group,
    active = list(),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Correlation")}))

correlationBase <- if (requireNamespace('jmvcore')) R6::R6Class(
    "correlationBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = 'jmvbaseR',
                name = 'correlation',
                version = c(1,0,0),
                options = options,
                results = correlationResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE)
        }))

#' Correlation
#'
#' 
#' @param data the data as a data frame
#' @param x a string specifying the first measurement in \code{data}
#' @param y a string specifying the second measurement in \code{data}
#' @param alternative \code{'two.sided'}, \code{'less'}, or \code{'greater'}
#' @param method \code{'pearson'}, \code{'kendall'}, or \code{'spearman'}
#' @param conf.level a number between 0 and 1 (default: 0.95), specifying the
#'   confidence interval width
#' @return A results object containing:
#' \tabular{llllll}{
#' }
#'
#' @export
correlation <- function(
    data,
    x,
    y,
    alternative = "two.sided",
    method = "pearson",
    conf.level = 0.95) {

    if ( ! requireNamespace('jmvcore'))
        stop('correlation requires jmvcore to be installed (restart may be required)')

    options <- correlationOptions$new(
        x = x,
        y = y,
        alternative = alternative,
        method = method,
        conf.level = conf.level)

    results <- correlationResults$new(
        options = options)

    analysis <- correlationClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}
