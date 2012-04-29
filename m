From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 11:03:08 +0200
Subject: [Buildroot] [PATCH 2/2] u-boot: bump to 2012.04.01 release
In-Reply-To: <1335539109-6447-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 27 Apr 2012 12:05:09 -0300")
References: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
 <1335539109-6447-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vhe7vw3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump from 2012.04 to 2012.04.01
 Gustavo> Fixes a nasty bug in the command line processing.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  boot/uboot/Config.in                               |    8 ++++----
 Gustavo>  ...012.04-change-kernel-address-in-dataflash.patch |    0
 Gustavo>  2 files changed, 4 insertions(+), 4 deletions(-)
 Gustavo>  rename boot/uboot/{uboot-2012.04 => uboot-2012.04.01}/uboot-2012.04-change-kernel-address-in-dataflash.patch (100%)

 Gustavo> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 Gustavo> index 7c5f2c6..0d6a2b2 100644
 Gustavo> --- a/boot/uboot/Config.in
 Gustavo> +++ b/boot/uboot/Config.in
 Gustavo> @@ -12,12 +12,12 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 Gustavo>  choice
 Gustavo>  	prompt "U-Boot Version"
 Gustavo> -	default BR2_TARGET_UBOOT_2012_04
 Gustavo> +	default BR2_TARGET_UBOOT_2012_04_01

I prefer to keep the Kconfig option the same and just update the bool ""
description, similar to how we do it for the kernel/busybox.

Committed with that change.

-- 
Bye, Peter Korsgaard
