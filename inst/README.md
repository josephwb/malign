
<div style="background-color:rgba(233, 122, 114, 1); middle; padding:10px 10px;">

<b>DISCLAIMER:</b> This package is meant for humour purposes, in the
grand tradition of self-deprecation. To be clear: being mean is
<u><i>not</i></u> cool, kids. Please do not use this package to be toxic
to others. Also, take care of yourself.<br/><br/> Now, go and have some
fun.<br/> - Jay Dubs

</div>

# malign

Positive encouragement is nifty, but have ya tried *negative
encouragement*?

[![Linux Build
Status](https://travis-ci.com/josephwb/malign.svg?branch=master)](https://travis-ci.com/josephwb/malign)
[![R build
status](https://github.com/josephwb/malign/workflows/R-CMD-check/badge.svg)](https://github.com/josephwb/malign/actions)
[![Windows Build
status](https://ci.appveyor.com/api/projects/status/github/josephwb/malign?svg=true)](https://ci.appveyor.com/project/josephwb/malign)
[![Codecov test
coverage](https://codecov.io/gh/josephwb/malign/branch/master/graph/badge.svg)](https://app.codecov.io/gh/josephwb/malign?branch=master)

## Overview

Everyone needs to be taken down a peg once in a while, especially
oneself! Forked from the complementary (*and* complimentary!) package
[praise](https://github.com/rladies/praise), malign provides ready-made
insults for use when code does not run as expected. Useful for
troubleshooting code, or just to make oneself feel bad.

## Installation

``` r
devtools::install_github("josephwb/malign");
```

## Usage

``` r
library(malign);
malign();
```

    #> [1] "You are stomach-turning!"

`malign()` currently supports the following parts of speech:

``` r
names(malign_parts);
```

    #> [1] "adjective"     "adverb"        "adverb_manner" "created"      
    #> [5] "creating"      "exclamation"   "rpackage"      "frowny"       
    #> [9] "result"

You can pass a template specifying these supported parts of speech, and
`malign()` fills in random words of the matching type:

``` r
malign("${EXCLAMATION}! You have done this ${adverb_manner}!");
```

    #> [1] "GAK! You have done this discourteously!"

Prefer your jabs to be in emoticon form? No problem:

``` r
malign("${frowny}");
```

    #> [1] "D8"

Is ‘malign’ too *hoity-toity* for you? Try some other commands (note:
harshness does not differ across commands):

``` r
insult("${EXCLAMATION}! That was quite ${adjective}!");
```

    #> [1] "MERDE! That was quite ungroomed!"

or:

``` r
dis("${EXCLAMATION}!!! That was certainly a ${result}!");
```

    #> [1] "WTF!!! That was certainly a letdown!"

or:

``` r
zing("${EXCLAMATION}! That code executed quite ${adverb_manner}!");
```

    #> [1] "GEE-WHIZ! That code executed quite shabbily!"

or:

``` r
snark("${EXCLAMATION}! Your coding ability is just ${adjective}!");
```

    #> [1] "BAISE MOI! Your coding ability is just secretive!"

Note that capitalization in the inserted words will be the same as in
the template:

``` r
malign("${Exclamation}! ${EXCLAMATION}! ${Exclamation}! This is just ${adjective}!");
```

    #> [1] "Dang! SHUCKS! Gosh! This is just unamazing!"

## License

MIT © [Joseph W. Brown](https://github.com/josephwb)
