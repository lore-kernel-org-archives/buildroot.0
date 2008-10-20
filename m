From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 20:57:41 +0200
Subject: [Buildroot] bug in uclibc.mk in latest tree
In-Reply-To: <76d9e2a30810200915s327c04a8we682872f5ff60795@mail.gmail.com>
	(Hai Zaar's message of "Mon\, 20 Oct 2008 18\:15\:04 +0200")
References: <76d9e2a30810200915s327c04a8we682872f5ff60795@mail.gmail.com>
Message-ID: <87vdvnw0uy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hai" == Hai Zaar <haizaar@haizaar.com> writes:

Hi,

 Hai> After updating to r23746, make fails with the following:
 Hai> toolchain/uClibc/uclibc.mk:654: *** extraneous `endif'.  Stop.

Yeah, sorry about that - My fault :/

It's fixed in r23747.

So much for doing one move "obvious" change before going home.

-- 
Bye, Peter Korsgaard
