Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67449C83F20
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 221EC60A89;
	Sat, 12 Jul 2025 11:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfFa78Rbm_Fs; Sat, 12 Jul 2025 11:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3293460A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3293460A88;
	Sat, 12 Jul 2025 11:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B26B106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7172980824
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6hRa5x2UxhU for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E61808AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E61808AC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A71E88633E; Sat, 12 Jul 2025 11:22:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 13:15:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 793c5ad89de81c656a51779e042f39dd0f9b4dc7
X-Git-Newrev: b4ce212da1558a68c8648022f8b5bfb6ff8b5d57
X-Patchwork-Hint: ignore
Message-Id: <20250712112238.A71E88633E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: bump to version 0.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4ce212da1558a68c8648022f8b5bfb6ff8b5d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, mainly adds dead zone for the Steam Deck analog sticks.
Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.12/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 0ec6077c2c..dac0d3707e 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.11.sha256sum
-sha256  b812b94e08632ba62a30960a8de29217a73a2fff5da2f12acc8a5d4771a49a70  libmanette-0.2.11.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.12.sha256sum
+sha256  48b349267180f1dc34d405a9e1e90ba16f054a19ce907930e679493d911ea1d8  libmanette-0.2.12.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 44beef836f..b67f2cc086 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).11
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).12
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
