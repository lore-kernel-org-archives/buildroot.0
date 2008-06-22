From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Jun 2008 13:17:01 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <1214130344.2605.8.camel@localhost> (Luigi Mantellini's message
	of "Sun\, 22 Jun 2008 12\:25\:44 +0200")
References: <20080621194717.98BEF3C725@busybox.net>
	<1214130344.2605.8.camel@localhost>
Message-ID: <87myldra6q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luigi" == Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com> writes:

 Luigi> Ciao,
 Luigi> why do we need this?

As it otherwise dies with a missing fenv.h.

See the recent discussion on the list.

-- 
Bye, Peter Korsgaard
