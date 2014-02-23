From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 18:54:42 +0100
Subject: [Buildroot] [PATCH] package/rt-tests: fix Kconfig syntax
In-Reply-To: <1393176587-27407-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 23 Feb 2014 18:29:47 +0100")
References: <1393176587-27407-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zjlhogt9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Fixes:
 >     $ make menuconfig
 >     [...]
 >     package/rt-tests/Config.in:10: syntax error
 >     package/rt-tests/Config.in:9: invalid option
 >     package/rt-tests/Config.in:36: syntax error
 >     package/rt-tests/Config.in:35: invalid option
 >     make[1]: *** [oldconfig] Error 1
 >     make: *** [_all] Error 2

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>

Sorry, I already fixed it myself (in the same way) before I saw your
patch.

-- 
Bye, Peter Korsgaard
