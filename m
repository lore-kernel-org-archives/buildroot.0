From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Feb 2019 12:47:18 +0100
Subject: [Buildroot] U-Boot update needed in imx23evk_defconfig
Message-ID: <20190208124718.650e4d42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

The imx23evk_defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295124

This is due to the bump of OpenSSL to 1.1.x. This issue seems to have
been fixed in U-Boot commit 7bae13b7579a6bc42330427496330fe2a29cbd56,
which is part of U-Boot since 2017.01, but the defconfig is using
2016.09.

Do you think you could update U-Boot in this defconfig to at least
2017.01 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
