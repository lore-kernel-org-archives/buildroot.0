Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF553C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D63E81CAD;
	Tue, 20 Sep 2022 06:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D63E81CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66zD0TroHI8t; Tue, 20 Sep 2022 06:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C5481C67;
	Tue, 20 Sep 2022 06:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C5481C67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 089AC1BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D730E410B1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D730E410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-Sx0hCDSUVE for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:50:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A0B410B0
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A0B410B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A36DD85BEB; Tue, 20 Sep 2022 06:50:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 08:49:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c84f8742be47141639c32436927a624c1690f6b2
X-Git-Newrev: 518603e78f859626f999d65a2ce67b8f70a96823
X-Patchwork-Hint: ignore
Message-Id: <20220920065016.A36DD85BEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: bump to version 6.3.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=518603e78f859626f999d65a2ce67b8f70a96823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6.mk                           | 2 +-
 package/qt6/qt6base/qt6base.hash             | 7 ++++---
 package/qt6/qt6serialport/qt6serialport.hash | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 03e87d0574..b609baf4c6 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.3
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index bd5fa9e445..e43a6ff52d 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,6 +1,7 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
-sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
-# Hashes for license files:
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.2/submodules/qtbase-everywhere-src-6.3.2.tar.xz.sha256
+sha256  7929ba4df870b6b30870bc0aed2525cfc606ed7091107b23cf7ed7e434caa9a6  qtbase-everywhere-src-6.3.2.tar.xz
+
+# Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9780eb86fe..50202a1e26 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtserialport-everywhere-src-6.3.1.tar.xz.sha256
-sha256  4eb6d80e65799dd2e0318df4dfba14173c1929e861718cda9bedca24253b616e  qtserialport-everywhere-src-6.3.1.tar.xz
+sha256  c7d207322367c63647edbd06ded9c76ba9071961daac1d1021b622b762c35e6f  qtserialport-everywhere-src-6.3.2.tar.xz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
