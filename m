From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Feb 2011 14:07:38 +0100
Subject: [Buildroot] First day with buildroot
In-Reply-To: <1297943420.4856.2.camel@dublxciaranr1.verifone.com> (Quotient
	Remainder's message of "Thu, 17 Feb 2011 11:50:19 +0000")
References: <AANLkTimbBptSub=x_KvcnAt+And2=-NpAPH+m8RR5vmH@mail.gmail.com>
	<1297943420.4856.2.camel@dublxciaranr1.verifone.com>
Message-ID: <87bp2a95d1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Quotient" == Quotient Remainder <quotientvremainder@gmail.com> writes:

 Quotient> Ar C?ad, 2011-02-16 at 20:12 -0800, Charles Krinke wrote:
 Quotient>     Below are the last half dozen lines of my first compile with buildroot. I
 Quotient>     set it up for a powerpc architecture and selected almost all the defaults,
 Quotient>     changing only things like ext2 to jffs2 file system. I did select the
 Quotient>     "general" for sub-architecture (as opposed to say, e300c2).
 Quotient>     /usr/bin/ld: cannot find -lc
 Quotient>     --

 Quotient> "sudo yum install glibc-static"
 Quotient> You need the static C library to build host-module-init-tools

Indeed. Notice that this is a FAQ:

http://buildroot.net/buildroot.html#faq

-- 
Bye, Peter Korsgaard
