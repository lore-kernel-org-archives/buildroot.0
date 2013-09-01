From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Sep 2013 21:37:53 +0200
Subject: [Buildroot] [PATCH] neon: disable webdav when no XML support is
	available
In-Reply-To: <1378043691-28892-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 1 Sep 2013 15:54:51 +0200")
References: <1378043691-28892-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3j0coz2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since 9169810a9bd97c99d8b7a0e8aadabdcca3883e99 ("neon: replace
 Thomas> 'choice' for XML library with two options") the option
 Thomas> BR2_PACKAGE_NEON_NOXML no longer exists. However, it was not taken
 Thomas> into account properly within neon.mk, as this option was still used to
 Thomas> disable webdav support when no XML library has been selected.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/7ed/7ed657570d83b28389dd8c01ffdd895d2e8d145f/

Ups, committed - Thanks.

-- 
Bye, Peter Korsgaard
