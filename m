From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:18:32 +0100
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161111151832.1649d24e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 18:53:27 +0300, Vlad Zakharov wrote:
> With this commit we update ARC defconfigs with the following:
> 
>   - "snps_axs101_defconfig", "snps_axs103_defconfig" and
>     "snps_hs38_smp_vdk_defconfig":
>      - bump linux kernel version to 4.8.6
>      - set up host linux headers to 4.8
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/snps_axs101_defconfig       | 6 +++---
>  configs/snps_axs103_defconfig       | 6 +++---
>  configs/snps_hs38_smp_vdk_defconfig | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
