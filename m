From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Dec 2009 08:39:59 +0100
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
	(joyful@sonic.net's message of "Mon, 21 Dec 2009 16:01:41 -0800")
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	<87oclsxbyz.fsf@macbook.be.48ers.dk>
	<62f4f618adb8f0fb041b8033370948f3.squirrel@webmail.sonic.net>
Message-ID: <87fx73xxrk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "joyful" == joyful  <joyful@sonic.net> writes:

 joyful> Hi Peter,
 joyful> Thanks for helping me. I was merely trying to create a whole new platform.
 joyful> When I type make defconfig, there was no old config
 joyful> file, then I just select items that may fit my needs by hit enter or y or n.

 joyful> With 2009.11 verison buildroot, I think it is much better, but I
 joyful> got this message at the end, indication something I was not configured
 joyful> correctly:

 joyful> `/tmp/buildroot-2009.11/output/build/linux-2.6.31.6'
 joyful> make[1]: *** No rule to make target `zImage'.  Stop.
 joyful> make[1]: Leaving directory
 joyful> `/tmp/buildroot-2009.11/output/build/linux-2.6.31.6'
 joyful> make: *** [/tmp/buildroot-2009.11/output/images/zImage] Error 2

This is again the Linux kernel build failing. I think the easiest way of
figuring out what goes wrong is for you to post your .config file

-- 
Bye, Peter Korsgaard
