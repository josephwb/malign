
re_match <- function(pattern, x) {
  stopifnot(length(x) == 1);
  mat <- regexpr(pattern, x, perl=TRUE);

  if (mat != -1L) {
    res <- substring(x, mat, mat + attr(mat, "match.length") - 1L);
    if (length(attr(mat, "capture.start"))) {
      res <- c(
        res,
        substring(
          x,
          attr(mat, "capture.start"),
          attr(mat, "capture.start") + attr(mat, "capture.length") - 1
        )
      );
    }
    if (any(attr(mat, "capture.names") != "")) {
      names(res) <- c("", attr(mat, "capture.names"));
    }
    return(res);
  } else {
    return(NULL);
  }
}

# `func' arg allows testing of malign aliases. is_hacky(this) = TRUE
malign_check <- function(template, regexp, num=13, func="malign") {
  for (i in 1:num) {
    mal <- "";
    if (func == "malign") {
      mal <- malign(template);
    } else if (func == "insult") {
      mal <- insult(template);
    } else if (func == "dis") {
      mal <- dis(template);
    } else if (func == "snark") {
      mal <- snark(template);
    } else if (func == "zing") {
      mal <- zing(template);
    }
    match <- re_match(regexp, mal);
    expect_true(!is.null(match), info=template);

    parts <- sub("[0-9]*$", "", names(match[-1]));
    for (p in seq_along(parts)) {
      expect_true(tolower(match[p + 1]) %in% tolower(malign_parts[[ parts[p] ]]));
    }
  }
}

is_capitalized <- function(x) {
  return(toupper(substring(x, 1, 1)) == substring(x, 1, 1) &
    tolower(substring(x, 2)) == substring(x, 2));
}

is_all_uppercase <- function(x) {
  return(toupper(x) == x);
}

is_all_lowercase <- function(x) {
  return(tolower(x) == x);
}
