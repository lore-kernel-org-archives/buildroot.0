From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jan 2011 23:03:08 +0100
Subject: [Buildroot] [PATCH 3/6] gdb: make it a proper package
In-Reply-To: <1293795546-19674-6-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 31 Dec 2010 08:39:03 -0300")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hbdrc6ar.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Convert gdb to a proper autotargets package
 Gustavo> * Add version 7.2
 Gustavo> * Drop version 6.6
 Gustavo> * Mark version 6.7.1 (non-avr32) as deprecated

 Gustavo> Kconfig can't handle duplicate choices and we can't make source depend
 Gustavo> on anything.
 Gustavo> To fix this we suffix the different version choices for each case (in
 Gustavo> the toolchain menu with internal toolchain, in the package menu for
 Gustavo> target gdb/gdbserver for internal and external toolchains.

 Gustavo> TODO: copy gdbserver from external toolchains

Hmm, I don't quite like this Config.in.{internal,external} stuff, I'll
take a look and see if I can combine them.

-- 
Bye, Peter Korsgaard
