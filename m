Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C573ACAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A5461B85;
	Mon, 22 Sep 2025 18:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cysRb-AevLLp; Mon, 22 Sep 2025 18:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A374B61B78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A374B61B78;
	Mon, 22 Sep 2025 18:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F03E11C0
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF110414CA
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjE5Dd86CMSK for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2793841149
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2793841149
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15AD38619C; Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 20:44:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79a489c683ee2d5f5562187d8ff492c9a2aa167d
X-Git-Newrev: 9ca5434350d00d9ab5a09be64acedf91efcf9f3b
X-Patchwork-Hint: ignore
Message-Id: <20250922185834.15AD38619C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: bump to version 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ca5434350d00d9ab5a09be64acedf91efcf9f3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the first release considered feature-complete, and despite the
ceremonious version number, it mainly includes fixes and API additions
providing improved ergonomics.

  https://gitlab.gnome.org/GNOME/libdex/-/blob/1.0.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index 6d78b0842a..2a2a7b62cc 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.1.sha256sum
-sha256  7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6  libdex-0.10.1.tar.xz
+# From https://download.gnome.org/sources/libdex/1.0/libdex-1.0.0.sha256sum
+sha256  7b8f5c5db3796e14e12e10422e2356766ba830b92815fee70bbc867b5b207f5d  libdex-1.0.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index aea4c60ab7..839b0006f6 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBDEX_VERSION_MAJOR = 0.10
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_VERSION_MAJOR = 1.0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
