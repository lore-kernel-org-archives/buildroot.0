From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Dec 2009 09:57:00 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
In-Reply-To: <op.u4j8accoyqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Mon, 7 Dec 2009 09:52:50 +0100")
References: <op.u4j7ikxlyqa4qb@jap> <873a3nqj1q.fsf@macbook.be.48ers.dk>
	<op.u4j8accoyqa4qb@jap-lappis.nevion.com>
Message-ID: <87pr6rp3fn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 >> I take it that this is with busybox cp and not coreutils? You might have
 >> better luck asking on the busybox list.

 Joachim> This is with busybox, yes. Will repost to the busybox list and see
 Joachim> what comes up.

Ok.

 >> Why not simply use cat instead?

 Joachim> Actually, I have never thought of that, but will that start from the
 Joachim> beginning of the MTD block?

Yes it will.

 Joachim> We have used "cp mtdblock2 /dev/mtdblock2" for 7 years in the
 Joachim> product, this is the first time I have seen it fail.

OK. FYI, busybox nowadays also has the flashcp applet from mtd-utils
which does the right thing.

-- 
Bye, Peter Korsgaard
