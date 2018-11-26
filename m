From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:56:07 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build with newer freerdp
In-Reply-To: <20181124104107.29147-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 24 Nov 2018 11:41:07 +0100")
References: <20181124104107.29147-1-yann.morin.1998@free.fr>
Message-ID: <87va4ju3ig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit a63aad66d3 (package/freerdp: bump version to 2.0.0-rc2)
 > introduced a FreeRDP that has a different API, and this breaks
 > weston.

 > Backport a patch from upstream weston to fix the issue.

 > Fixes:
 >     http://autobuild.buildroot.org/results/c0b4f7c4cee2c11715ecc2ef0cfb42f80dbf81b0/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
