From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 13:52:16 +0100
Subject: [Buildroot] how to change compiler flags for a specific package
In-Reply-To: <1233664525.6263.3.camel@sven> (Sven Neumann's message of "Tue\,
	03 Feb 2009 13\:35\:25 +0100")
References: <1233664525.6263.3.camel@sven>
Message-ID: <8763jrfzsv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 Sven> Hi,
 Sven> I have a question about buildroot. I need to compile a specific package
 Sven> with different compiler flags than the default. By default -Os is used
 Sven> in my buildroot setup, but as this triggers a compiler bug when
 Sven> compiling flac, I would like to change this to -O2 for the flac package
 Sven> (which uses Makefile.autotools.in). What is the best way to do that?

For what arch, and what goes wrong exactly?

You can probably put your alternative CFLAGS in FLAC_MAKE_ENV or
FLAC_MAKE_OPT to get the package to use it.

-- 
Bye, Peter Korsgaard
