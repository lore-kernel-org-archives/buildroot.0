Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCEBC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D1370142;
	Tue, 21 Feb 2023 01:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D1370142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWvLdqROmzrz; Tue, 21 Feb 2023 01:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B58970155;
	Tue, 21 Feb 2023 01:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B58970155
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2B5E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8757000D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8757000D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ6dlvdKQWPF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC0DA70004
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0DA70004
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85D9828C8; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:52:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bfb5035c6fae1285ff0100275083fabc2b9816c1
X-Git-Newrev: 74686296a4a20438f1e94e22a5a3372df2e830cc
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.E85D9828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6: bump version to
 6.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=74686296a4a20438f1e94e22a5a3372df2e830cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For details see [1] and [2].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.1/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.2/release-note.md

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6.mk                           | 2 +-
 package/qt6/qt6base/qt6base.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 575b2f826c..431bb8c9d3 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).0
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index fedbbba79f..63af373836 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256
-sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256
+sha256  a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c705525d  qtbase-everywhere-src-6.4.2.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 54a45681fa..1eaa3d6150 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256
-sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256
+sha256  336d95919037800184b3c3de8ccb6f62954b20f3756c05adce8d5010504340fa  qtserialport-everywhere-src-6.4.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
