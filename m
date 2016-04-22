From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 22 Apr 2016 07:56:26 +0200
Subject: [Buildroot] [PATCH] configs: atmel: xplained boards: bump to
 linux4sam_5.3
In-Reply-To: <20160421222113.6311afb5@free-electrons.com>
References: <1461055991-24856-1-git-send-email-ludovic.desroches@atmel.com>
 <20160421222113.6311afb5@free-electrons.com>
Message-ID: <20160422055626.GB3532@odux.rfo.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 21, 2016 at 10:21:13PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 19 Apr 2016 10:53:11 +0200, Ludovic Desroches wrote:
> > Bump defconfigs relative to Xplained boards to linux4sam_5.3 release. It
> > involves to use at91bootstrap v3.8.5.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > ---
> >  configs/atmel_sama5d2_xplained_mmc_defconfig | 6 +++---
> >  configs/atmel_sama5d3_xplained_defconfig     | 6 +++---
> >  configs/atmel_sama5d3_xplained_mmc_defconfig | 6 +++---
> >  configs/atmel_sama5d4_xplained_defconfig     | 6 +++---
> >  configs/atmel_sama5d4_xplained_mmc_defconfig | 6 +++---
> >  5 files changed, 15 insertions(+), 15 deletions(-)
> 
> Applied to master, thanks. Any reason for not updating the other atmel
> defconfigs that uses the linux4sam Git repositories?

Latest linux4sam releases are focused on Xplained boards. Most of the
updates concerns them. Tests have been done only for these boards.

> 
> at91sam9g45m10ek_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> at91sam9g45m10ek_defconfig:BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> at91sam9rlek_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> at91sam9rlek_defconfig:BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> at91sam9x5ek_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> at91sam9x5ek_defconfig:BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> atmel_sama5d4ek_defconfig:BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
> atmel_sama5d4ek_defconfig:BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
> 
> Perhaps all of them should be using linux4sam 5.3 as well?

Yes. We have to take time and check if there is any issue with
linux4sam_5.3 components and older boards.

Regards

Ludovic
