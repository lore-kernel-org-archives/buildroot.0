From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 14:38:16 +0100
Subject: [Buildroot] [PATCH 7/9] sysklogd: convert to gentargets and
	bump to 1.5
In-Reply-To: <1286527389-29983-7-git-send-email-Martin.Banky@gmail.com>
	(Martin Banky's message of "Fri, 8 Oct 2010 01:43:06 -0700")
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
	<1286527389-29983-7-git-send-email-Martin.Banky@gmail.com>
Message-ID: <87vd4b3n7b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:

 Martin> Also, changed the site to Debian, to get the latest patches
 Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
 Martin> ---
 Martin>  package/sysklogd/-sysklogd-susv3-legacy.patch |   20 ++++++
 Martin>  package/sysklogd/-sysklogd.patch              |   91 +++++++++++++++++++++++++
 Martin>  package/sysklogd/sysklogd-susv3-legacy.patch  |   20 ------
 Martin>  package/sysklogd/sysklogd.mk                  |   85 +++++++++++------------

Why this rename? If they aren't used any more, then we should simply
remove them.

-- 
Bye, Peter Korsgaard
