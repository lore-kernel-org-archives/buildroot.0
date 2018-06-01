From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jun 2018 11:20:08 +0200
Subject: [Buildroot] snps_archs38_hsdk_defconfig fails to build
Message-ID: <20180601112008.05171019@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ARC Maintainers,

The snps_archs38_hsdk_defconfig fails to build in the master branch.
See the log at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/71727022

Could you look into this and provide a patch to fix this problem ?
Perhaps it is fixed by
https://git.buildroot.org/buildroot/commit/configs?h=next&id=63bf9e71d6153f5a8e73e191cff8ff39f409026b
which is just in next ?

Thanks a lot,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
