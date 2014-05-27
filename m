From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 27 May 2014 21:22:27 +0200
Subject: [Buildroot] Buildroot manual: author list
Message-ID: <CAAXf6LXSqbJAjOi-YvEdPvcC=-XZE+6Z1Y-d2BRWEhMXu6ufFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently, the Buildroot manual contains the following in the introduction:

"Buildroot usage and documentation by Thomas Petazzoni. Contributions
from Karsten Kruse, Ned Ludd, Martin Herren and others."

This text (besides the 'and others' part) dates from the initial
version of the documentation, commit
32fcf718f82c241e890af8c7ccc10ef6c438331a, back in 2004.
(http://git.buildroot.org/buildroot/commit/?id=32fcf7)

In these 10 years, the manual has expanded a lot, and many people have
contributed. A shortlog of the original location docs/buildroot.html
(at commit 41c1cb44cd60819f8ba20024e23e431c00b279d7)


$ git shortlog -sn  docs/buildroot.html
    31  Thomas Petazzoni
    28  Peter Korsgaard
    15  Bernhard Reutner-Fischer
    11  Ulf Samuelsson
     6  Mike Frysinger
     3  Bj?rn Forsman
     3  Martin Banky
     1  Daniel Mack
     1  Eric Andersen
     1  Gustavo Zacarias
     1  Lionel Landwerlin
     1  Luca Ceresoli
     1  Peter Huewe
     1  Yegor Yefremov
     1  grante

and a shortlog of the new directory docs/manual (at current master):

$ git shortlog -sn  docs/manual
    49  Thomas Petazzoni
    40  Samuel Martin
    35  Thomas De Schampheleire
    28  Yann E. MORIN
    15  Jerzy Grzegorek
    12  Arnout Vandecappelle (Essensium/Mind)
    11  Peter Korsgaard
     4  Samuel MARTIN
     4  Simon Dawson
     3  Arnout Vandecappelle
     3  Francois Perrad
     3  Luca Ceresoli
     3  Maxime Hadjinlian
     3  Maxime Ripard
     3  Nathan Lynch
     3  Ryan Barnett
     3  Stephan Hoffmann
     3  eric.le.bihan.dev at free.fr
     2  Gustavo Zacarias
     2  Mischa Jonker
     2  Shawn Landden
     1  A.R.D
     1  Alexandre Belloni
     1  Alvaro G. M
     1  Davide Viti
     1  Fabio Porcedda
     1  J?r?me Pouiller
     1  Marek Belisko
     1  Ralph Siemsen
     1  Shawn J. Goff
     1  Sonic Zhang
     1  Spenser Gilliland
     1  Stefan Fr?berg
     1  Tilman Keskin?z
     1  Trevor Woerner
     1  Tzu-Jung Lee
     1  Vinicius Tinti


My feeling is that the current listing of authors is not correct
towards all these other people. There are at least three alternatives
to do something about this:

a. replace the author reference in buildroot by a reference to 'the
Buildroot developers' and let interested people look up the real list
in git.

b. expand the list with some of the major contributors to the manual,
based on the shortlogs above

c. add an appendix with a generated list (shortlog) of authors, which
is then complete and up-to-date.


I'm leaning more to a. or b. than to c.
The advantage of a. over b. is that there is no discussion about whose
name should be in the list (where to draw the line), while b. has the
advantage of giving more explicit credit.

The purpose of this mail is to request your feedback about this.

Thanks,
Thomas
