Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A49CCAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC780418C3;
	Sun, 21 Sep 2025 11:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4B5ctto3GaER; Sun, 21 Sep 2025 11:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7641441856
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7641441856;
	Sun, 21 Sep 2025 11:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E9FFBF
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D8B60A9F
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85DXo_TDggXC for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 11:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293E360A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293E360A99
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 11:05:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18A678607D; Sun, 21 Sep 2025 11:05:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Sep 2025 12:54:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45e7fe281160fe645e26ad58775aa5e384dbf222
X-Git-Newrev: 5d2abdc66ca687c926e1c4546c12aca7f7d72ca4
X-Patchwork-Hint: ignore
Message-Id: <20250921110525.18A678607D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: bump to version 2.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d2abdc66ca687c926e1c4546c12aca7f7d72ca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
was removed because it has been integrated upstream in [1].

Release notes:
https://www.atoptool.nl/downloadatop.php

[1] https://github.com/Atoptool/atop/commit/631defdd22e3b6872c440d368d7acf459150eea5

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...low-the-user-to-pass-additional-CFLAGS-an.patch | 32 ----------------------
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
deleted file mode 100644
index 0fc8f142b1..0000000000
--- a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 5 Aug 2024 23:38:08 +0200
-Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS and
- LDFLAGS
-
-This is needed for some build systems. For example, Buildroot needs to
-disable optimizations on some CPU architectures.
-
-Upstream: https://github.com/Atoptool/atop/pull/314
-[Waldemar: rebase on top of 2.11.0]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 3a63f69..ab44eaa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
- PMPATHD  = /usr/lib/systemd/system-sleep
- 
- PKG_CONFIG ?= pkg-config
--CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
--LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
-+override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
-+override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
- OBJMOD0  = version.o
- OBJMOD1  = various.o  deviate.o   procdbase.o
- OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o ifprop.o parseable.o
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 8f0cb69581..aeb9a469d7 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  77650f79f9e388b6f5666dc113849894575a29bb4de21b8cd58767bf8a905154  atop-2.11.1.tar.gz
+sha256  0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  atop-2.12.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 155dec6177..b4a5bda52e 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.11.1
+ATOP_VERSION = 2.12.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
