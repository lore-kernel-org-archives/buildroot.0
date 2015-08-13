From: yuanlinyu <cugyly@163.com>
Date: Thu, 13 Aug 2015 21:03:47 +0800 (CST)
Subject: [Buildroot] BR2_arm1136j_s in config.in.arm
Message-ID: <7904fb17.d9ed.14f2728c6c5.Coremail.cugyly@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
"BR2_arm1136j_s" in config.in.arm seems not work because no BR2_arm1136j_s configuration item. how to configure buildroot for soc with arm1136j-s cpu?


config BR2_GCC_TARGET_CPU
	default "arm920t"	if BR2_arm920t
	default "arm922t"	if BR2_arm922t
	default "arm926ej-s"	if BR2_arm926t
	default "arm1136j-s"	if BR2_arm1136j_s


thanks

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150813/18a6dde6/attachment.html>
