From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:06:37 +0200
Subject: [Buildroot] [PATCH 1/2] u-boot: remove stale patches and bump
 to 2013.07
In-Reply-To: <1375268797-11457-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375268797-11457-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130731180637.33cb3037@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 08:06:36 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  boot/uboot/Config.in                               |   4 +-
>  ...011.12-change-kernel-address-in-dataflash.patch | 195 ---------------------
>  ...012.04-change-kernel-address-in-dataflash.patch | 195 ---------------------
>  3 files changed, 2 insertions(+), 392 deletions(-)
>  delete mode 100644 boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
>  delete mode 100644 boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch

Committed both patches, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
