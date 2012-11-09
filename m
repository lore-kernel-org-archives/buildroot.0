From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 09:58:31 +0100
Subject: [Buildroot] [PATCH] add new package grantlee
In-Reply-To: <1351715883-10799-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 (Zoltan@osuosl.org's message of "Wed, 31 Oct 2012 21:38:03 +0100")
References: <1351715883-10799-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <87txsz6tl4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan  <Zoltan@osuosl.org> writes:

 Zoltan> From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 Zoltan> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 Zoltan> ---
 Zoltan>  package/Config.in            |    1 +
 Zoltan>  package/grantlee/Config.in   |    9 +++++++++
 Zoltan>  package/grantlee/grantlee.mk |   13 +++++++++++++
 Zoltan>  3 files changed, 23 insertions(+)
 Zoltan>  create mode 100644 package/grantlee/Config.in
 Zoltan>  create mode 100644 package/grantlee/grantlee.mk

 Zoltan> diff --git a/package/Config.in b/package/Config.in
 Zoltan> index ab966e0..ef68b37 100644
 Zoltan> --- a/package/Config.in
 Zoltan> +++ b/package/Config.in
 Zoltan> @@ -139,6 +139,7 @@ source "package/qt/Config.in"
 Zoltan>  if BR2_PACKAGE_QT
 Zoltan>  comment "QT libraries and helper libraries"
 Zoltan>  source "package/qtuio/Config.in"
 Zoltan> +source "package/grantlee/Config.in"

We normally sort entries alphabetically, so I put it over qtuio and
committed, thanks.

-- 
Bye, Peter Korsgaard
