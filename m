From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 8 Oct 2012 14:59:35 +0000 (UTC)
Subject: [Buildroot] RFC: Manual refactoring - Request for feedback
 before Buildroot Developer Days.
References: <CAHXCMMLVWx3iwf0sJziz-LWDXr77biZ+c3iarcNWm7sE5wkrRQ@mail.gmail.com>
Message-ID: <k4upon$5po$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-10-07, Samuel Martin <s.martin49@gmail.com> wrote:

> we will really appreciate feedback about the current manual:
>
> - what is good

Good things about the current manual:

 1) It is available on line in a single HTML page.  Please, please, in
    the name of all that's usable, don't split it up into hundreds of
    HTML pages each with few sentences sentences and the dreaded
    "next, prev, up" buttons.  Having it on a single page allows you
    to search using the browser's "find" facility and makes it easy to
    skim through to find waht you want.

 2) The HTML version renders well at any window width.  Some manuals
    have code examples that force the the entire page to be rendered
    with with a line length that's hundreds of characters long -- the
    resulting pages end up being way too wide for easy use.

 3) It's writtenin asciidoc.

     a) Allows generation of a variety of formats (PDF, HTML, text).

     b) Makes it easy to read source and submit patches.

    Something like reStructuredText would also be fine.  I fear
    LaTeX's time has passed, and XML's time[1] has never arrived
    (hopefully it never will).

    [1] XML is fine as a machine-generated and machine-read format,
        but no human should ever be expected to edit it except in an
        emergency.

-- 
Grant Edwards               grant.b.edwards        Yow! Did YOU find a
                                  at               DIGITAL WATCH in YOUR box
                              gmail.com            of VELVEETA?
