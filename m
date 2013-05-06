From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 16:37:58 +0200
Subject: [Buildroot] [PATCH v4 5/5] configs: add defconfig for Atmel
	AT91SAM9260-EK Nand Flash Boot
In-Reply-To: <1367849457-31738-6-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 6 May 2013 16:10:57 +0200")
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
 <1367849457-31738-6-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87zjw8gomx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> This is a configuration that provides a basic setup for generating
 Fabio> bootable nandflash images:
 Fabio> - at91bootstrap
 Fabio> - barebox
 Fabio> - kernel
 Fabio> - rootfs

Same comments as for the evk-pro3 support.

-- 
Bye, Peter Korsgaard
