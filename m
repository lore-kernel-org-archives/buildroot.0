From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 20:20:06 +0100
Subject: [Buildroot] DirectFB fetch problem (no tarball on the primary
	mirror)
In-Reply-To: <1232553321.6326.18.camel@sven> (Sven Neumann's message of "Wed\,
	21 Jan 2009 16\:55\:21 +0100")
References: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com>
	<1232550294.6326.12.camel@sven> <8763k8sncv.fsf@macbook.be.48ers.dk>
	<1232553321.6326.18.camel@sven>
Message-ID: <87fxjcqxeh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

Hi,

 Sven> I have run some tests here with DirectFB 1.2.7 cross-compiled
 Sven> for ARM.  Everything I tested (mostly stuff from
 Sven> DirectFB-examples) works fine.  Attached is a patch to the
 Sven> directfb.mk file that updates it to 1.2.7 and converts it to
 Sven> Makefile.autotools.in.

Thanks. It didn't apply as it wasn't against latest svn (apparently
something pre-rc1). I fixed it up and cleaned up a few small things,
but please create patches against latest svn in the future.

-- 
Bye, Peter Korsgaard
