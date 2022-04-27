Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E429DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A15C5400BA;
	Wed, 27 Apr 2022 19:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pyWeDY-2l3Q; Wed, 27 Apr 2022 19:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97E2240C28;
	Wed, 27 Apr 2022 19:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 776691BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B0460EEC
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phFArCuxboU2 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0338A61001
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5F217845FF; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4065b6004c278a832389e9ab5311410d8cd0fad7
X-Git-Newrev: 2dacd52d27b06536f084368ae0f1352aff33915b
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.5F217845FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 4.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dacd52d27b06536f084368ae0f1352aff33915b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch | 2 +-
 package/harfbuzz/harfbuzz.hash                              | 2 +-
 package/harfbuzz/harfbuzz.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
index 9fa09863c6..102f9ff493 100644
--- a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
+++ b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
@@ -26,7 +26,7 @@ diff --git a/meson.build b/meson.build
 index bf3925db..6d263d48 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -281,7 +281,9 @@ endif
+@@ -270,7 +270,9 @@ endif
  # threads
  thread_dep = null_dep
  if host_machine.system() != 'windows'
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1576824a5a..f3ba228353 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73  harfbuzz-4.2.0.tar.xz
+sha256  bd17916513829aeff961359a5ccebba6de2f4bf37a91faee3ac29c120e3d7ee1  harfbuzz-4.2.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 551277a788..38ed34ab70 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.2.0
+HARFBUZZ_VERSION = 4.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
