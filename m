From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 2 May 2014 17:50:01 +0200 (CEST)
Subject: [Buildroot] [PATCH] lsof: fix "'TCP_*' undeclared" build errors
In-Reply-To: <61985964.1908854.1399044584132.JavaMail.zimbra@advansee.com>
References: <1399042764-22388-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1399042764-22388-2-git-send-email-benoit.thebaudeau@advansee.com>
 <61985964.1908854.1399044584132.JavaMail.zimbra@advansee.com>
Message-ID: <793700355.1909595.1399045801162.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, May 2, 2014 5:29:44 PM, Beno?t Th?baudeau wrote:
> On Friday, May 2, 2014 4:59:24 PM, Beno?t Th?baudeau wrote:
> > With some configurations, cross-building lsof results in the following
> > errors:
> 
> FYI, I had this issue on 64-bit Ubuntu 13.10, building with a custom
> cross-toolchain for ARM926EJ-S based on Linaro 2011.08 4.5.4 20110808 and
> EGLIBC
> 2.13 and generated using crosstool-NG hg_default at 2617_41bd6777fa4f.

This issue had already occurred in BuildRoot's automatic build tests:
http://autobuild.buildroot.org/results/ade/ade3629f72bf2195bde086a8c403197c0d1fdba3/build-end.log

Beno?t
