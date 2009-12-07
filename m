From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Dec 2009 09:34:25 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
In-Reply-To: <op.u4j7ikxlyqa4qb@jap> (Joachim Pihl's message of "Mon, 7 Dec
	2009 09:36:15 +0100")
References: <op.u4j7ikxlyqa4qb@jap>
Message-ID: <873a3nqj1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

 Joachim> This may not be related to Buildroot, but I am completely stumped:

I take it that this is with busybox cp and not coreutils? You might have
better luck asking on the busybox list.

 Joachim> # cp mtdblock2 /dev/mtdblock2

So you want cp to detect that the target is a special file and not
unlink it, but instead do something like cat mtdblock2 >/dev/mtdblock2 ?

Why not simply use cat instead?

-- 
Bye, Peter Korsgaard
