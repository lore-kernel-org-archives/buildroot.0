From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Apr 2013 22:21:35 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump relevant configs to
	kernel version 3.9.x
In-Reply-To: <1367260224-15880-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 29 Apr 2013 15:30:24 -0300")
References: <1367260224-15880-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehdt3x68.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Problematic configurations not bumped:
 Gustavo> powerpc-g3beige: Kernel oops on boot
 Gustavo> sh4-r2d - Qemu doesn't emulate advanced features from the console UART
 Gustavo> sparc-ss10 - Illegal instruction

Committed, thanks.

-- 
Bye, Peter Korsgaard
