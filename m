From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Dec 2009 10:28:48 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
In-Reply-To: <op.u4j9e0v8yqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Mon, 7 Dec 2009 10:17:14 +0100")
References: <op.u4j7ikxlyqa4qb@jap> <873a3nqj1q.fsf@macbook.be.48ers.dk>
	<op.u4j8accoyqa4qb@jap-lappis.nevion.com>
	<87pr6rp3fn.fsf@macbook.be.48ers.dk>
	<op.u4j9e0v8yqa4qb@jap-lappis.nevion.com>
Message-ID: <87ljhfp1yn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 >> OK. FYI, busybox nowadays also has the flashcp applet from mtd-utils
 >> which does the right thing.

 Joachim> Thanks, that solved the problem. Will simply replace "cp mtdblock2
 Joachim> /dev/mtdblock2" with "flashcp mtdblock2 /dev/mtd2" and all is well.

Ok, but please still bring it up on the busybox list if it is a cp
regression.

-- 
Bye, Peter Korsgaard
