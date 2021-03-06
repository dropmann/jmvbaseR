
# This file is automatically generated, you probably don't want to edit this

ttestOneSOptions <- if (requireNamespace('jmvcore')) R6::R6Class(
    "ttestOneSOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            x = NULL,
            alternative = "two.sided",
            mu = 0,
            confLevel = 0.95, ...) {

            super$initialize(
                package='jmvbaseR',
                name='ttestOneS',
                requiresData=TRUE,
                ...)

            private$..x <- jmvcore::OptionVariable$new(
                "x",
                x)
            private$..alternative <- jmvcore::OptionList$new(
                "alternative",
                alternative,
                options=list(
                    "two.sided",
                    "less",
                    "greater"),
                default="two.sided")
            private$..mu <- jmvcore::OptionNumber$new(
                "mu",
                mu,
                default=0)
            private$..confLevel <- jmvcore::OptionNumber$new(
                "confLevel",
                confLevel,
                default=0.95)

            self$.addOption(private$..x)
            self$.addOption(private$..alternative)
            self$.addOption(private$..mu)
            self$.addOption(private$..confLevel)
        }),
    active = list(
        x = function() private$..x$value,
        alternative = function() private$..alternative$value,
        mu = function() private$..mu$value,
        confLevel = function() private$..confLevel$value),
    private = list(
        ..x = NA,
        ..alternative = NA,
        ..mu = NA,
        ..confLevel = NA)
)

ttestOneSResults <- if (requireNamespace('jmvcore')) R6::R6Class(
    inherit = jmvcore::Group,
    active = list(),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="One Sample T-Test")}))

ttestOneSBase <- if (requireNamespace('jmvcore')) R6::R6Class(
    "ttestOneSBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = 'jmvbaseR',
                name = 'ttestOneS',
                version = c(1,0,0),
                options = options,
                results = ttestOneSResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE)
        }))

#' One Sample T-Test
#'
#' 
#' @param data the data as a data frame
#' @param x a string specifying the variable in \code{data}
#' @param alternative \code{'two.sided'}, \code{'less'}, or \code{'greater'}
#' @param mu a number specifying the mean of the null hypothesis
#' @param confLevel a number between 0 and 1 (default: 0.95) specifying the
#'   confidence interval width
#' @return A results object containing:
#' \tabular{llllll}{
#' }
#'
#' @export
ttestOneS <- function(
    data,
    x,
    alternative = "two.sided",
    mu = 0,
    confLevel = 0.95) {

    if ( ! requireNamespace('jmvcore'))
        stop('ttestOneS requires jmvcore to be installed (restart may be required)')

    options <- ttestOneSOptions$new(
        x = x,
        alternative = alternative,
        mu = mu,
        confLevel = confLevel)

    results <- ttestOneSResults$new(
        options = options)

    analysis <- ttestOneSClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}
