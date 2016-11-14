From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 14 Nov 2016 12:32:29 +0000
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <20161111151832.1649d24e@free-electrons.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
Message-ID: <1479126748.3874.28.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

We apologize for coming late with that update.
But could you please apply it on master as it is important for us to come up with latest kernel in upcoming Buildroot release.
Updated configs were build- and run tested on corresponding platforms, so there shouldn't be any regressions there.

Thanks.


On Fri, 2016-11-11 at 15:18 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 10 Nov 2016 18:53:27 +0300, Vlad Zakharov wrote:
> > 
> > With this commit we update ARC defconfigs with the following:
> > 
> > ? - "snps_axs101_defconfig", "snps_axs103_defconfig" and
> > ????"snps_hs38_smp_vdk_defconfig":
> > ?????- bump linux kernel version to 4.8.6
> > ?????- set up host linux headers to 4.8
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > ---
> > ?configs/snps_axs101_defconfig???????| 6 +++---
> > ?configs/snps_axs103_defconfig???????| 6 +++---
> > ?configs/snps_hs38_smp_vdk_defconfig | 6 +++---
> > ?3 files changed, 9 insertions(+), 9 deletions(-)
> 
> Applied to next, thanks.
> 
> Thomas
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
