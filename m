From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:57:03 +0200
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.10.8 in vdk
 defconfig
In-Reply-To: <1491495579-26960-1-git-send-email-vzakhar@synopsys.com>
References: <1491495579-26960-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170406215703.716052ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 19:19:39 +0300, Vlad Zakharov wrote:
> With this commit we update snps_archs38_vdk_defconfig with the
> following:
>   - bump linux kernel version to 4.10.8
>   - set up host linux headers to 4.10
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  configs/snps_archs38_vdk_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
