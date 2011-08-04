From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 4 Aug 2011 22:56:24 +0000 (UTC)
Subject: [Buildroot] [RFC] Using AsciiDoc for the Buildroot manual
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
Message-ID: <j1f82o$qh9$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-08-04, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> The Buildroot documentation was started by myself in December 2004
> (see commit 32fcf718f82c241e890af8c7ccc10ef6c438331a), and at that
> time the amount of documentation was relatively light, so the single
> HTML file was seen as an appropriate solution to write the
> documentation.
>
> Since then, the documentation has expanded quite a bit, and I intend
> to do some more important additions to the documentation in the near
> future, but I feel like the hand-written HTML format is a bit
> annoying.
>
> Therefore, this set of patches proposes to switch the documentation
> over to the AsciiDoc format [1]. It is a very simple text-baseda
> format, from which you can generate HTML (single page or splitted),
> PDF, text, and more.

Sounds like a great idea to me.

I use asciidoc for the internal user's manual for the platform which
runs the results of my buildroot use.  That document weighs in at
about 90 pages (in USLetter PDF format).  I find asciidoc very easy to
work with, and it's a lot less work than hand-coded HTML or using
something like OpenOffice/LibreOffice.

FWIW, I prefer the PDF produced by the fop backend over that produced
by dblatex, but that's a matter of taste (I usually use the HTML
version of my document).

I also agree 100% with the decision to keep the option of a
single-HTML-page document. Splitting up documents in to dozens or even
hundreds of separate HTML pages makes them almost impossible to
search.

-- 
Grant Edwards               grant.b.edwards        Yow! Pardon me, but do you
                                  at               know what it means to be
                              gmail.com            TRULY ONE with your BOOTH!
