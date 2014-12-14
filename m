From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 17:49:22 +0100
Subject: [Buildroot] [PATCH] package/blktrace: do not build in parallel
In-Reply-To: <1418574667-23018-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Dec 2014 17:31:07 +0100")
References: <1418574667-23018-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87fvcip46l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The Makefile is not parallel safe.
 > Fixes numerous build failures:
 >     http://autobuild.buildroot.org/results/c7f/c7f0b22c6d256c75ade223af702c5f29c6c677d8/
 >     http://autobuild.buildroot.org/results/4ab/4abb0d2590528c634766103ee8ffd648ad5c04d3/
 >     ...

 > Look for the message:
 >     btreplay.o: file not recognized: File truncated

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
