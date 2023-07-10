Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97BEEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950328211C;
	Mon, 10 Jul 2023 17:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 950328211C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxZw7Yhpq6fH; Mon, 10 Jul 2023 17:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD48820F1;
	Mon, 10 Jul 2023 17:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD48820F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9B141BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED1D4177F
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED1D4177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIOsGAlLLadD for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FF241794
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FF241794
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29E2E86C79; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:43:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7d1e92b1cbbb67cebea8e43d087fcc1aab657e7
X-Git-Newrev: 4c1b141c2900fa8085b1bc148ad54c2e7ff85a96
X-Patchwork-Hint: ignore
Message-Id: <20230710174525.29E2E86C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump version to 20.2-Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c1b141c2900fa8085b1bc148ad54c2e7ff85a96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 ...atBuffer-Remove-forward-declararion-of-Fl.patch | 42 ----------------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  2 +-
 5 files changed, 4 insertions(+), 46 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 72a2f05bd6..569bde8cd2 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 20.1-Nexus
+KODI_JSONSCHEMABUILDER_VERSION = 20.2-Nexus
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index cb6b04d069..44eba85d75 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 20.1-Nexus
+KODI_TEXTUREPACKER_VERSION = 20.2-Nexus
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
deleted file mode 100644
index 87df0e4c9a..0000000000
--- a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
-Date: Sun, 28 May 2023 00:49:40 +0200
-Subject: [PATCH] SavestateFlatBuffer: Remove forward declararion of
- FlatBufferBuilder
-
-This caused a compiler error with recent faltbuffers because the type changed:
-
-In file included from xbmc/cores/RetroPlayer/savestates/SavestateDatabase.cpp:12:
-xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h:19:7: error: definition of type 'FlatBufferBuilder' conflicts with type alias of the same name
-class FlatBufferBuilder;
-      ^
-/usr/include/flatbuffers/flatbuffer_builder.h:1414:7: note: 'FlatBufferBuilder' declared here
-using FlatBufferBuilder = FlatBufferBuilderImpl<false>;
-      ^
-1 error generated.
-
-(cherry picked from commit 351184d7e4e3edc447d04a297769eb41a477ba68)
-
-Upstream: https://github.com/xbmc/xbmc/commit/07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-index cb93e6bbc2e12..fa42a9bad7034 100644
---- a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-+++ b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
-@@ -14,11 +14,6 @@
- 
- #include <flatbuffers/flatbuffers.h>
- 
--namespace flatbuffers
--{
--class FlatBufferBuilder;
--}
--
- namespace KODI
- {
- namespace RETRO
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index ea9a588aeb..37fbf0c004 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cd4158b2bc2d9593ad2f5c1cd2494957ab726b13d8379bbfb09d7d36df7b7d7e  kodi-20.1-Nexus.tar.gz
+sha256  4e81abf81172812bc8891f69a7a80a2b846298cecaae7b5009725e28a3040c23  kodi-20.2-Nexus.tar.gz
 sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
 sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 70ed270555..7cbc1df40a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 20.1
+KODI_VERSION_MAJOR = 20.2
 KODI_VERSION_NAME = Nexus
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
