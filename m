From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 May 2012 20:29:30 +0200
Subject: [Buildroot] [PATCH resend] Bump gpsd from version 2.95 to
	version 3.5
In-Reply-To: <1338200626-3945-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 28 May 2012 11:23:46 +0100")
References: <1338200626-3945-1-git-send-email-spdawson@gmail.com>
Message-ID: <87vcjg6tx1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/gpsd/Config.in                     |   17 +--
 spdawson>  package/gpsd/gpsd-fix-compile-errors.patch |   14 +++
 spdawson>  package/gpsd/gpsd-fix-libgpsmm.patch       |   23 ----
 spdawson>  package/gpsd/gpsd-navcom.patch             |   47 ---------

This patch is not renamed on the next branch, so I cannot directly apply
this before I merge next into master. Please consider making patches
relative to the next branch after -rc1.

-- 
Bye, Peter Korsgaard
