From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Mar 2008 15:52:01 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <20080305140643.GA626@real.realitydiluted.com>
	(sjhill@realitydiluted.com's message of "Wed\,
	5 Mar 2008 08\:06\:43 -0600")
References: <20080305133525.0B2FF120129@busybox.net>
	<87fxv5qnfg.fsf@macbook.be.48ers.dk>
	<20080305140643.GA626@real.realitydiluted.com>
Message-ID: <871w6pql4e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sjhill" == sjhill  <sjhill@realitydiluted.com> writes:

Hi,

 sjhill> At least when compiling for ARM, the build fails because of 'setjmp.h'
 sjhill> being included multiple times. I thing the check is stupid,
 sjhill> so I removed

Ok, haven't seen that problem on x86 or ppc.

-- 
Bye, Peter Korsgaard
