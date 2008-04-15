From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 15 Apr 2008 12:52:39 +0200
Subject: [Buildroot] atstk1002_defconfig problems and (possible) fix
References: <48045BB1.9000406@logicway.de>
Message-ID: <008e01c89ee9$7bf15040$dfb5fea9@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Arndt Kritzner" <kritzner@logicway.de>
To: <buildroot@uclibc.org>
Sent: Tuesday, April 15, 2008 9:39 AM
Subject: [Buildroot] atstk1002_defconfig problems and (possible) fix


file doesn't exist:
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox-1.6.0.config"

> in my local copy changed to "package/busybox/busybox-1.6.0.config"

this doesn't work any more:
BR2_LINUX_COPYTO_TFTPBOOT=y
BR2_LINUX_COPYTO=""

> in my local copy changed to BR2_LINUX_COPYTO="/tftpboot"

Gru? und tsch?s
Arndt
-- 

I did not have a chance to look at it in detail, but I think
Peter Korsgaard made a mistake when "fixing" this.

Best Regards
Ulf Samuelsson
