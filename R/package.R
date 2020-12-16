
##' @title Positive encouragement is nifty, but have ya tried \emph{negative encouragement}?
##' @name malign
##' @description Everyone needs to be taken down a peg once in a while, especially
##' oneself! Forked from the complementary (and complimentary!) package praise,
##' malign provides ready-made insults for use when code does run not as expected.
##' Useful for troubleshooting code, or just to make oneself feel worse.
##' @docType package
##' @aliases malign malign-package
NULL


##' @title Parts of speech for maligning
##' @format Named list of character vectors. List entries: \describe{
##'   \item{adjective}{Words and phrases to be used as negative adjectives.}
##'   \item{adverb}{Adverbs.}
##'   \item{adverb_manner}{Adverbs of manner, with negative meanings.}
##'   \item{created}{Negative synonyms of \sQuote{create} in paste tense.}
##'   \item{creating}{Negative synonyms of \sQuote{create}, in present participle form.}
##'   \item{exclamation}{Negative exclamations.}
##'   \item{rpackage}{Synonyms for the term \sQuote{R package}.}
##'   \item{result}{Words and phrases used to connote negative results.}
##'   \item{frowny}{Negative emoticons.}
##' }
##' @include adjective.R adverb.R exclamation.R rpackage.R frowny.R verb.R
##' @export
malign_parts <- list(
  adjective = adjective,
  adverb = adverb,
  adverb_manner = adverb_manner,
  created = created,
  creating = creating,
  exclamation = exclamation,
  rpackage = rpackage,
  frowny = frowny,
  result = result
)


##' @title Randomized insults based on a template
##' @details
##' Replace parts of the template with random words from the malign word lists.
##' See examples below.
##' @param template Character scalar, the template string.
##' @export
##' @examples
##' malign()
##'
##' ## Capitalization
##' malign("${Exclamation}! This ${rpackage} is ${adjective}!")
##'
##' ## All upper case
##' malign("${EXCLAMATION}! You have done this ${adverb_manner}!")
malign <- function(template = "You are ${adjective}!") {
  while (is_template(template)) {
    template <- replace_one_template(template);
  }
  template
}

template_pattern <- "\\$\\{([^\\}]+)\\}";

is_template <- function(x) grepl(template_pattern, x);

replace_one_template <- function(template) {
  match <- regexpr(template_pattern, template, perl=TRUE);

  template1 <- substring(
    template,
    match,
    match + attr(match, "match.length") - 1L
  );

  part <- substring(
    template,
    attr(match, "capture.start"),
    attr(match, "capture.start") + attr(match, "capture.length") - 1L
  );

  match_case_sub(
    template1,
    part,
    sample(malign_parts[[tolower(part)]], 1),
    template
  );
}

match_case_sub <- function(pattern, part, replacement, text) {
  if (toupper(part) == part) {
    replacement <- toupper(replacement);
  } else if (capitalize(part) == part) {
    replacement <- capitalize(replacement);
  }
  sub(pattern, replacement, text, fixed=TRUE);
}

capitalize <- function(x) {
  paste0(toupper(substring(x, 1, 1)), substring(x, 2));
}


## Function aliases ##

##' @export
##' @rdname malign
insult <- function (template = "You are ${adjective}!") {
  malign(template);
}

##' @export
##' @rdname malign
dis <- function (template = "You are ${adjective}!") {
  malign(template);
}

##' @export
##' @rdname malign
snark <- function (template = "You are ${adjective}!") {
  malign(template);
}

##' @export
##' @rdname malign
zing <- function (template = "You are ${adjective}!") {
  malign(template);
}
