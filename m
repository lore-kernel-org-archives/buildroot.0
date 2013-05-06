From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 16:55:39 +0200
Subject: [Buildroot] [PATCH] board/freescale: switch to u-boot 2013.04
In-Reply-To: <1367851681-12228-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 6 May 2013 11:48:01 -0300")
References: <1367851681-12228-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vc6wgntg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

 Gustavo> @@ -29,4 +29,4 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 Gustavo>  # Bootloader
 Gustavo>  BR2_TARGET_UBOOT=y
 Gustavo>  BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
 Gustavo> -BR2_TARGET_UBOOT_2012_10=y
 Gustavo> +BR2_TARGET_UBOOT_2013_04=y

This will have to change to UBOOT_CUSTOM_VERSION once that lands.

-- 
Bye, Peter Korsgaard
