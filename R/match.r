#' Extract matched groups from a string
#'
#' Vectorised over `string` and `pattern`.
#'
#' @inheritParams str_detect
#' @param pattern Pattern to look for, as defined by an ICU regular
#'   expression. See [stringi::stringi-search-regex] for more details.
#' @return For `str_match`, a character matrix. First column is the
#'   complete match, followed by one column for each capture group.
#'   For `str_match_all`, a list of character matrices.
#'
#' @seealso [str_extract()] to extract the complete match,
#'   [stringi::stri_match()] for the underlying
#'   implementation.
#' @export
#' @examples
#' strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
#'   "387 287 6718", "apple", "233.398.9187  ", "482 952 3315",
#'   "239 923 8115 and 842 566 4692", "Work: 579-499-7527", "$1000",
#'   "Home: 543.355.3679")
#' phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
#'
#' str_extract(strings, phone)
#' str_match(strings, phone)
#'
#' # Extract/match all
#' str_extract_all(strings, phone)
#' str_match_all(strings, phone)
#'
#' x <- c("<a> <b>", "<a> <>", "<a>", "", NA)
#' str_match(x, "<(.*?)> <(.*?)>")
#' str_match_all(x, "<(.*?)>")
#'
#' str_extract(x, "<.*?>")
#' str_extract_all(x, "<.*?>")
str_match <- function(string, pattern) {
  if (type(pattern) != "regex") {
    stop("Can only match regular expressions", call. = FALSE)
  }

  stri_match_first_regex(string,
    pattern,
    opts_regex = opts(pattern)
  )
}

#' @rdname str_match
#' @export
str_match_all <- function(string, pattern) {
  if (type(pattern) != "regex") {
    stop("Can only match regular expressions", call. = FALSE)
  }

  stri_match_all_regex(string,
    pattern,
    opts_regex = opts(pattern)
  )
}
