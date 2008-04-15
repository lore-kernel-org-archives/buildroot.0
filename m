From: Arndt Kritzner <kritzner@logicway.de>
Date: Tue, 15 Apr 2008 09:39:29 +0200
Subject: [Buildroot] atstk1002_defconfig problems and (possible) fix
Message-ID: <48045BB1.9000406@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

--
