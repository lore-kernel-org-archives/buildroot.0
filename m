From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 00:30:28 +0200
Subject: [Buildroot] [PATCH] package/gcc: backport PR56780 patches
In-Reply-To: <1431284486-4996-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 10 May 2015 21:01:26 +0200")
References: <1431284486-4996-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87mw1cjcaj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > --disable-install-libiberty configure option is broken
 > in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.

 > This library broke the host-gdb build due to a fpic/fPIC issue.

 > Fixes:
 > http://autobuild.buildroot.net/results/28f/28f3074e99a35f4321dad2fa6c5abdad14d2d2c6/

 > And many more.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
