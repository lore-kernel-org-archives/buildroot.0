From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 14:59:23 +0100
Subject: [Buildroot] [PATCH 8/9] sysvint: convert to gentargets and bump
	to 2.88
In-Reply-To: <1286527389-29983-8-git-send-email-Martin.Banky@gmail.com>
	(Martin Banky's message of "Fri, 8 Oct 2010 01:43:07 -0700")
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
	<1286527389-29983-8-git-send-email-Martin.Banky@gmail.com>
Message-ID: <87mxpn3m84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:

 Martin> Also, changed the site to Debian, to get the latest patches
 Martin> As for the BR2_PACKAGE_UTIL_LINUX_NG variable, its in preparation for the,
 Martin> hopefully soon, conversion to util-linux-ng

 Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
 Martin> ---
 Martin>  package/sysklogd/-sysklogd-susv3-legacy.patch |   20 ------
 Martin>  package/sysklogd/-sysklogd.patch              |   91 -------------------------

Why?

 Martin>  package/sysvinit/sysvinit-2.86-gentoo.patch   |    9 ---
 Martin>  package/sysvinit/sysvinit.mk                  |   71 +++++++++----------

-- 
Bye, Peter Korsgaard
