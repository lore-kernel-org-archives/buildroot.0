From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 31 Mar 2010 10:53:34 +0200
Subject: [Buildroot] [PATCH] toolchain: prepare for more than two
	alternatives
In-Reply-To: <20100326194637.8693.94538.stgit@roazhon.bzh.lan> (Yann
	E. MORIN's message of "Fri, 26 Mar 2010 20:46:37 +0100")
References: <20100326194619.8693.69302.stgit@roazhon.bzh.lan>
	<20100326194637.8693.94538.stgit@roazhon.bzh.lan>
Message-ID: <87r5n0an3l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
 Yann> Lay down the path to add more than two toolchain kinds:
 Yann> - check the type of toolchain as:
 Yann>     ifeq (toolchain_buildroot,y)
 Yann>         blabla buildroot-specific
 Yann>     else ifeq (toolchain_external,y)
 Yann>         blabla external-specific
 Yann>     endif

Committed, thanks.

-- 
Bye, Peter Korsgaard
