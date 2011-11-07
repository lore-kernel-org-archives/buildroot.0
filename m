From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Nov 2011 23:39:24 +0100
Subject: [Buildroot] [PATCH v2] add support for virtual terminal
In-Reply-To: <4EB7C53D.4030902@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 07 Nov 2011 12:47:09 +0100")
References: <4EB7C53D.4030902@visionsystems.de>
Message-ID: <87pqh3d0bn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> introduces new option "Enable virtual console on tty1"
 Yegor> to enable virtual terminal on tty1

I'm not sure I like another option for this - Can't you just use the
existing GENERIC_SERIAL and/or the post-build script for this?

-- 
Bye, Peter Korsgaard
