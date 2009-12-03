From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 03 Dec 2009 19:06:13 +0100
Subject: [Buildroot] [git commit master] kernel-headers: add 2.6.32
In-Reply-To: <op.u4dfxpxuyqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Thu, 3 Dec 2009 17:54:51 +0100")
References: <20091203163920.709DF777B6@busybox.osuosl.org>
	<op.u4dfxpxuyqa4qb@jap-lappis.nevion.com>
Message-ID: <87aay0rkyy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

 Joachim> On Thu, 03 Dec 2009 15:59:15 +0100, Peter Korsgaard
 Joachim> <jacmet@sunsite.dk> wrote:

 >> default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 >> default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
 >> default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
 >> +	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_31

 Joachim> that should  probably be BR2_KERNEL_HEADERS_2_6_32 ?

Argh, but ofcourse! That should teach me to not try to do too many
things at once :/

-- 
Bye, Peter Korsgaard
