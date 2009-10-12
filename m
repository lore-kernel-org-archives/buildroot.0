From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Oct 2009 22:04:25 +0200
Subject: [Buildroot] setting up buildroot for using OLD gcc / binutils
In-Reply-To: <4AD389B2.20400@wp.pl> (W. P.'s message of "Mon\,
	12 Oct 2009 21\:55\:30 +0200")
References: <4AD389B2.20400@wp.pl>
Message-ID: <87my3w4bw6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "W" == W P <laurentp@wp.pl> writes:

 W> Hi,
 W> how can I set up CURRENT buildroot to use OLD gcc/binutils/kernel/uClibc?
 W> I need gcc 3.4.4, kernel 2.6.12.6-venus, uClibc 0.9.28?

Some older toolchain versions are available if you enable BR_DEPRECATED
(Build options->Show packages that are deprecated or obsolete). It won't
give you those exact options, but it might be close enough.

-- 
Bye, Peter Korsgaard
