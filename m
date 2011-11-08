From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 08 Nov 2011 08:49:10 +0100
Subject: [Buildroot] [PATCH v2] add support for virtual terminal
In-Reply-To: <87pqh3d0bn.fsf@macbook.be.48ers.dk>
References: <4EB7C53D.4030902@visionsystems.de>
 <87pqh3d0bn.fsf@macbook.be.48ers.dk>
Message-ID: <4EB8DEF6.3020106@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.11.2011 23:39, schrieb Peter Korsgaard:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>  Yegor> introduces new option "Enable virtual console on tty1"
>  Yegor> to enable virtual terminal on tty1
>
> I'm not sure I like another option for this - Can't you just use the
> existing GENERIC_SERIAL and/or the post-build script for this?

I'd like to have both serial console and virtual one (on tty I experiment with my program and vie serial console I can do other administrative tasks. One could use ssh, but this implies having network connection). Every time I execute make clean or clone BR I loose my inittab. Earlier versions of inittab had some ttys predefined, but they were deleted, so I thought, it would be useful to add this as an option. This way everyone should be satisfied.

Yegor
