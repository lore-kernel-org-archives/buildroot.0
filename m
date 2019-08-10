From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 10:30:22 +0200
Subject: [Buildroot] Buildroot raspberrypi3_qt5we_defconfig no longer builds
Message-ID: <20190810103022.4b2f16f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, Peter,

The raspberrypi3_qt5we_defconfig in Buildroot no longer buids:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139278

The error is:

error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
               ^~~~~~~~~~
compilation terminated.

When building qt5webengine. Could you have a look and propose a patch
to address this issue ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
