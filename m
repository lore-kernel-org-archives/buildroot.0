From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:34:45 +0200
Subject: [Buildroot] c-sky defconfig build broken
Message-ID: <20190726163445.2093571b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

Following the addition of internal toolchain support for C-SKY, the
existing csky_gx6605s_defconfig no longer builds:

Incorrect selection of kernel headers: expected 5.2.x, got 4.9.x

See https://gitlab.com/buildroot.org/buildroot/-/jobs/259847794

Could you send a patch to fix this ? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
