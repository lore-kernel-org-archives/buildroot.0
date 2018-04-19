From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 16:15:02 +0200
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update linux
 version
In-Reply-To: <20180419135524.44727-1-Evgeniy.Didin@synopsys.com>
References: <20180419135524.44727-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180419161502.6414c2e8@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 16:55:24 +0300, Evgeniy Didin wrote:
> With this commit we update Linux kernel version to 4.16.3
> and Linux headers version to 4.16.
> For some configs we switch headers version to be independent from
> Linux kernel version.

Why ? The change doesn't make you independent at all from the Linux
kernel version, and causes two kernel tarballs to be downloaded instead
of one, which isn't nice.

Could you justify this change ?

(side note: could you use my @bootlin.com address instead of
@free-electrons.com. The DEVELOPERS file has been updated since quite
some time about this already. Thanks a lot!)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
