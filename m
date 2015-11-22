From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:31:22 +0100
Subject: [Buildroot] [PATCH 1/1] fastd: add upstream patch to fix build
	with musl
In-Reply-To: <1448199626-16900-1-git-send-email-rprebello@gmail.com> (Rodrigo
 Rebello's message of "Sun, 22 Nov 2015 11:40:26 -0200")
References: <1448199626-16900-1-git-send-email-rprebello@gmail.com>
Message-ID: <87k2p967rp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The missing 'sys/queue.h' issue when building with musl has been solved
 > by an upstream commit which eliminates the dependency on
 > 'net/if_ether.h' and, consequently, 'sys/queue.h' (needed on OpenBSD
 > since 'net/if_ether.h' uses LIST_* definitions).

 > As usual, the included patch can be dropped in the future when a new
 > version of this package gets released and integrated into Buildroot.

 > Fixes:
 >   http://autobuild.buildroot.net/results/14e/14e291e22b8c8a9c590f0c6ef4316f8ab0aa1fff/
 >   http://autobuild.buildroot.net/results/ed4/ed4437bed01138380cd42c0dc943cd3ec85e26f0/
 >   http://autobuild.buildroot.net/results/ad2/ad226962413dece4fee07143a2bcfe07c44d55b6/
 >   ...

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
