From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:08:55 +0200
Subject: [Buildroot] [PATCH v3] configs: bananapi_m1: bump kernel and
 uboot version
In-Reply-To: <20181010091031.25220-1-lothar.felten@gmail.com>
References: <20181010091031.25220-1-lothar.felten@gmail.com>
Message-ID: <20181014100855.3c059944@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 11:10:31 +0200, Lothar Felten wrote:
> New Linux kernel version 4.18.12
> New u-boot version 2018.07
> Config options were reordered by savedefconfig
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
> Changes v1->v2:
>  - set a fixed kernel version for toolchain headers and kernel
> Changes v2->v3:
>  - fix kernel header version typo
>  - build/test with correct image
> ---
>  configs/bananapi_m1_defconfig | 36 +++++++++++++-----------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
