From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 13 Sep 2007 19:11:38 -0700 (PDT)
Subject: [Buildroot] Busybox does not work with Buildroot toolchain for
	arm926ejs
Message-ID: <12667270.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All, 

 Here is the issue. 
1. I have used busybox utilities built inside
buildroot/project_build_arm/uclibc-prj/root. I am using Linux kernel version
2.6.20.6. when i boot, the busybox does not start and give any command
prompt on serial console or tty0.

It gives the message like "Please press Enter to activate this console".

2. Also i have compilled the above Linux kernel with the same buildroot
toolchain for arm926ejs and it works fine. 

3. I tried using the same toolchain and compilled an externally downloaded
busybox and when used this, i get the same error.

4. Also if i use Linux Kernel compilled with this Buildroot Toolchain for
arm926ejs and Busybox built with other vendor toolchain( from Codesourcery)
it works fine. 

5. Also i have Linux MTD Utilities that i have compilled using Buildroot
Toolchain & this works fine. 

So i want to know what exactly is the issue with busybox thats been built by
this Buildroot toolchain.

Attahced is the Busybox config, uclibc config & my Buildroot config.

Waiting for an early reply/help to solve this issue.

Regards
Guruaja
http://www.nabble.com/file/p12667270/busybox.config busybox.config 
http://www.nabble.com/file/p12667270/uclibc.config uclibc.config 
http://www.nabble.com/file/p12667270/buildroot_snapshot.config
buildroot_snapshot.config 
-- 
View this message in context: http://www.nabble.com/Busybox-does-not-work-with-Buildroot-toolchain-for-arm926ejs-tf4439704.html#a12667270
Sent from the BuildRoot mailing list archive at Nabble.com.
