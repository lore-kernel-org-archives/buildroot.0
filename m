From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 10:40:13 +0200
Subject: [Buildroot] patches support gcc4.3
In-Reply-To: <1213690842.23450.9.camel@localhost> (Luigi Mantellini's message
	of "Tue\, 17 Jun 2008 10\:20\:42 +0200")
References: <1213690842.23450.9.camel@localhost>
Message-ID: <873anctpxu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luigi" == Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com> writes:

 Luigi> Hi All, I'm new in this mailling list.  I'm trying to
 Luigi> understand the actual status of the gcc4.3 support into
 Luigi> buildroot (and soon). I'm working on a (ugly)coldfire 547x cpu
 Luigi> and gcc4.3 should (re) support my CPU.  Has anyone information
 Luigi> about the actual support status of gcc4.3 into buildroot?

There's so far no gcc 4.3 support in buildroot, but I know Bernhard
has gcc 4.3.0 support in his git tree. I might try to port it over
next weekend and update it for 4.3.1.

-- 
Bye, Peter Korsgaard
