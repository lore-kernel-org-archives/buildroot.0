Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDEACA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 308EC404E9;
	Sat,  2 Sep 2023 07:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 308EC404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXKxwkb2ZAZH; Sat,  2 Sep 2023 07:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582EC4048E;
	Sat,  2 Sep 2023 07:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 582EC4048E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3FF1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 536AE81232
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 536AE81232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZFGmDwwC9bL for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8054181239
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8054181239
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AEA5865A6; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:36:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0e30b87f9a278218950000882c607cf39a79e45
X-Git-Newrev: e8e66020f3fcac943595034ce7ec6fc6f1bc154b
X-Patchwork-Hint: ignore
Message-Id: <20230902073856.6AEA5865A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgpiod: bump to
 version 1.6.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e8e66020f3fcac943595034ce7ec6fc6f1bc154b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-build-add-a-configure-switch-for-building-examples.patch   | 6 +++---
 package/libgpiod/libgpiod.hash                                      | 2 +-
 package/libgpiod/libgpiod.mk                                        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
index a21c767006..f1a853a6f8 100644
--- a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
+++ b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
@@ -73,7 +73,7 @@ diff --git a/configure.ac b/configure.ac
 index 57c99a8..90a6324 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -155,6 +155,12 @@ then
+@@ -164,6 +164,12 @@ then
  	fi
  fi
  
@@ -84,8 +84,8 @@ index 57c99a8..90a6324 100644
 +AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
 +
  AC_ARG_ENABLE([bindings-cxx],
- 	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
- 	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
+ 	[AC_HELP_STRING([--enable-bindings-cxx],
+ 		[enable C++ bindings [default=no]])],
 -- 
 cgit 1.2.3-1.el7
 
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index f0803cab36..6647b77c5a 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7  libgpiod-1.6.3.tar.xz
+sha256  7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5  libgpiod-1.6.4.tar.xz
 # Hash for license file
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 35d003fa33..e7ff155618 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.3
+LIBGPIOD_VERSION = 1.6.4
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
