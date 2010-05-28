From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 May 2010 23:32:08 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: only copt the
	pthread lib if needed
In-Reply-To: <20100528212314.1541.49408.stgit@roazhon.bzh.lan> (Yann
	E. MORIN's message of "Fri, 28 May 2010 23:23:14 +0200")
References: <20100528212314.1541.49408.stgit@roazhon.bzh.lan>
Message-ID: <874ohru2zr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
 Yann> If threads are disabled, do not try to copy the libpthread.so from the
 Yann> external library.

Committed both, thanks!

-- 
Bye, Peter Korsgaard
