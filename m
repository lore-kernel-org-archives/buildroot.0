From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 00:45:33 +0200
Subject: [Buildroot] BR2_arm1136j_s in config.in.arm
In-Reply-To: <7904fb17.d9ed.14f2728c6c5.Coremail.cugyly@163.com> (yuanlinyu's
 message of "Thu, 13 Aug 2015 21:03:47 +0800 (CST)")
References: <7904fb17.d9ed.14f2728c6c5.Coremail.cugyly@163.com>
Message-ID: <87twrpzks2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yuanlinyu" == yuanlinyu  <cugyly@163.com> writes:

 > hi,
 > "BR2_arm1136j_s" in config.in.arm seems not work because no
 > BR2_arm1136j_s configuration item. how to configure buildroot for soc
 > with arm1136j-s cpu?

 > config BR2_GCC_TARGET_CPU
 > 	default "arm920t"	if BR2_arm920t
 > 	default "arm922t"	if BR2_arm922t
 > 	default "arm926ej-s"	if BR2_arm926t
 > 	default "arm1136j-s"	if BR2_arm1136j_s

Hmm, you're right. I've added it now to git master.

I don't think I have ever seen a non-vfp variant of the arm1136 in the
wild. What SoC are you using?

-- 
Bye, Peter Korsgaard
