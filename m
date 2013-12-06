From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 22:21:15 +0100
Subject: [Buildroot] [PATCH] board/raspberrypi: bump to use Linux 3.10
In-Reply-To: <1386360277-29475-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 6 Dec 2013 21:04:37 +0100")
References: <1386360277-29475-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877gbhd6b8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The new 'stable' branch of the Raspberry Pi kernel is now based
 > on the Linux 3.10 branch (currently 3.10.22), so bump both the
 > kernel bot for the toolchain headers, and for the target.

s/bot/version/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
