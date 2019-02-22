From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 21:48:17 +0100
Subject: [Buildroot] raspberrypi3_qt5we_defconfig on mind autobuilder
Message-ID: <20190222214817.698f98c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

The build of raspberrypi3_qt5we_defconfig was done today on Mind's
autobuilder, and it failed. See
https://gitlab.com/buildroot.org/buildroot/-/jobs/165766158. The issue
is simply:

arm-buildroot-linux-gnueabihf-g++.br_real: internal compiler error:
Killed (program cc1plus)

Could you check if you had an OOM situation perhaps ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
