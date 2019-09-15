From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:22:00 +0200
Subject: [Buildroot] Reproducible autobuild result issue
Message-ID: <20190915212200.43d16b0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

I have not followed closely all your latest patches on reproducible
testing with the autobuilders, but at least in the current setup, there
is a bug:

  http://autobuild.buildroot.net/results/7b4/7b40753dc8623310e05ecfc92de5582eb767beea//diffoscope-results.json

contains the output of "cmp". I guess it occurred on a machine that
does not have diffoscope installed. But in any case, it is very wrong
to have the result of "cmp" in a file named diffoscope-results.json,
no ?

Romain: this happened on your machine. Which version of the
autobuild-run script are you using a the moment ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
