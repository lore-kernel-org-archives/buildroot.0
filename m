From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:47:03 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2017.07
In-Reply-To: <20170712194351.20701-1-joerg.krause@embedded.rocks>
References: <20170712194351.20701-1-joerg.krause@embedded.rocks>
Message-ID: <20170721224703.65dd3e04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 21:43:51 +0200, J?rg Krause wrote:
> Drop patch 0005 which has been fixed upstream in a different way [1] by only
> building the Python libfdt library when needed [2].
> 
> [1] https://patchwork.ozlabs.org/patch/757380/
> [2] https://www.mail-archive.com/u-boot at lists.denx.de/msg251051.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...nditionally-disable-python-libfdt-wrapper.patch | 44 ----------------------
>  package/uboot-tools/uboot-tools.hash               |  2 +-
>  package/uboot-tools/uboot-tools.mk                 |  7 +---
>  3 files changed, 2 insertions(+), 51 deletions(-)
>  delete mode 100644 package/uboot-tools/0005-tools-conditionally-disable-python-libfdt-wrapper.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
