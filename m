Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D856C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2308460FB6;
	Mon, 21 Mar 2022 21:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVD7Z-jas6Ro; Mon, 21 Mar 2022 21:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3294760F6C;
	Mon, 21 Mar 2022 21:13:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 388C11BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34AD660FAF
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXTkAsvGyDA7 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77EEA60F6C
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1E40884D70; Mon, 21 Mar 2022 21:04:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:03:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88471fe4fdc3d25d81b5b6898415a0550d06b90b
X-Git-Newrev: d32a0992bd03b1f7a96be78c5942bda574c36dcb
X-Patchwork-Hint: ignore
Message-Id: <20220321210440.1E40884D70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump to version 3.18.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d32a0992bd03b1f7a96be78c5942bda574c36dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of Copyright.txt (year updated and Qt Company Ltd. added:
https://gitlab.kitware.com/cmake/cmake/-/commit/1edc4a8a7e759c4047dd1a1b9864b34f6cb4cc50
https://gitlab.kitware.com/cmake/cmake/-/commit/f8c505d4b30aa636b013486913591060b2040716)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cmake/cmake.hash | 6 +++---
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 97e83a274c..da514a6d6b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.16/cmake-3.16.9-SHA-256.txt
-sha256  1708361827a5a0de37d55f5c9698004c035abb1de6120a376d5d59a81630191f  cmake-3.16.9.tar.gz
+# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
+sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
 
 # Locally calculated
-sha256  dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
+sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b1b214982e..4177b119ab 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.16
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION_MAJOR = 3.18
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
