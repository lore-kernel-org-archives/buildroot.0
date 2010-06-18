From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jun 2010 23:20:44 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: 0.9.31.config:
	enable UCLIBC_SV4_DEPRECATED option
In-Reply-To: <4C1BDF9B.7000106@gmx.net> (Ossy's message of "Fri, 18 Jun 2010
	23:05:31 +0200")
References: <20100618114218.78624816CD@busybox.osuosl.org>
	<4C1BDF9B.7000106@gmx.net>
Message-ID: <87pqzo9gwj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

 Ossy> Hi,
 Ossy> Maybe it's known, but it is not only SV4_DEPR. I was forced to
 Ossy> activate "OBSOLETE BSD SIGNALS" too. SV4 is not sufficient for a
 Ossy> successful build.

 Ossy> xfsprogs/Config.in:
 Ossy> "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and
 Ossy> UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"

Strange. I did see the comment, but it built here without.

-- 
Bye, Peter Korsgaard
