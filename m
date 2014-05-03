From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:03:39 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test_fork when fork() is no
	available
In-Reply-To: <1399134782-18013-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 3 May 2014 18:33:02 +0200")
References: <1399134782-18013-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87iopmofas.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Samuel Martin <s.martin49@gmail.com>
 > zeromp's configure script correctly detects the fork availability, but
 > unconditionally build test_fork program whatever the fork() availability.

 > This patch fixes the build-system by disabling test_fork when fork is
 > not available (e.g. when !BR2_USEMMU).

The symbol is called BR2_USE_MMU.

Committed, thanks. Please don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
