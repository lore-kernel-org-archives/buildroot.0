From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Feb 2019 09:51:28 +0100
Subject: [Buildroot] Update needed for Buildroot zynq_zybo_defconfig
Message-ID: <20190213095128.6c7c159b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sebastian,

In 2016, you contributed support for the Zynq Zybo platform to
Buildroot, by adding the zynq_zybo_defconfig. This defconfig now fails
to build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295251

The build failure is due to the update of OpenSSL to 1.1.x, which
U-Boot 2016.05 is not compatible with.

Could you look at updating U-Boot to at least version v2017.07, which
contains commit c3b4328166b03d6749b86eb0fbb21a10e4395cfd that should
fix this problem ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
