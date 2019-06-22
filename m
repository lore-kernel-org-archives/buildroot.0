From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:49:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
In-Reply-To: <1559564887-4088-1-git-send-email-guoren@kernel.org>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
Message-ID: <20190622174942.472127c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Jun 2019 20:28:06 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
>  .../qemu/0002-configure-improve-usbfs-check.patch  | 60 ----------------------
>  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 +++++++++++++
>  .../3.1.0/0002-configure-improve-usbfs-check.patch | 60 ++++++++++++++++++++++
>  4 files changed, 95 insertions(+), 95 deletions(-)
>  delete mode 100644 package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>  delete mode 100644 package/qemu/0002-configure-improve-usbfs-check.patch
>  create mode 100644 package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
>  create mode 100644 package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch

Thanks, both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
