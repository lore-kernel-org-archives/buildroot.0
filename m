From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 16:40:52 +0100
Subject: [Buildroot] [PATCH 2/6] uClibc: remove useless
	linuxthreads-errno-fix patch
In-Reply-To: <898dc2c84add1fd58f43193bcfda39d64c0ae523.1352987586.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 15 Nov 2012 14:53:49 +0100")
References: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
 <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
 <898dc2c84add1fd58f43193bcfda39d64c0ae523.1352987586.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878va250xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This patch has since a long time been merged upstream in uClibc, so it
 Thomas> cannot apply on any of the recent uClibc snapshots.

I like it how you call my patches useless :P

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  .../uClibc.snapshot.linuxthreads-errno-fix.patch   |   68 --------------------
 Thomas>  1 file changed, 68 deletions(-)
 Thomas>  delete mode 100644 toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch

 Thomas> diff --git a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
 Thomas> deleted file mode 100644
 Thomas> index c4d0d00..0000000
 Thomas> --- a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
 Thomas> +++ /dev/null
 Thomas> @@ -1,68 +0,0 @@
 Thomas> -From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
 Thomas> -From: Peter Korsgaard <jacmet@sunsite.dk>
 Thomas> -Date: Mon, 5 Jul 2010 14:08:17 +0200
 Thomas> -Subject: [PATCH] don't make __errno_location / __h_errno_location hidden

-- 
Bye, Peter Korsgaard
