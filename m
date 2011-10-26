From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Oct 2011 11:12:29 +0200
Subject: [Buildroot] [PATCH 2/2] qemu_sh4_r2d: update to fix serial
	console support
In-Reply-To: <1319544631-31988-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 25 Oct 2011 09:10:31 -0300")
References: <1319544631-31988-1-git-send-email-gustavo@zacarias.com.ar>
 <1319544631-31988-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hb2wuneq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> sh4-r2d has a serial port, however it's the second SH UART
 Gustavo> that's emulated by Qemu so we need to adjust the kernel
 Gustavo> configuration for it to see the relevant UART and adjust the
 Gustavo> qemu command line for it too.

Committed, thanks.

-- 
Bye, Peter Korsgaard
