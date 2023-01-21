Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E115C004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F367A4048A;
	Sat, 21 Jan 2023 13:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F367A4048A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_TxW__Ecdpk; Sat, 21 Jan 2023 13:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC27405C6;
	Sat, 21 Jan 2023 13:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC27405C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0C51BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A719F82CDE
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A719F82CDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YB4MjWuevNth for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA8F882C3C
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA8F882C3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D904E86946; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca2be02a6a53213be06dcd11b11ae0b2b2702679
X-Git-Newrev: a4befb442e2fe1e5438fa5cee8c8a79ded69c832
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.D904E86946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vte: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4befb442e2fe1e5438fa5cee8c8a79ded69c832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vte/vte.hash | 2 +-
 package/vte/vte.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vte/vte.hash b/package/vte/vte.hash
index 90818d31f3..8c84dfce1a 100644
--- a/package/vte/vte.hash
+++ b/package/vte/vte.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/vte/0.66/vte-0.66.2.sha256sum
+# Hash from: https://download.gnome.org/sources/vte/0.66/vte-0.66.2.sha256sum
 sha256  e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976  vte-0.66.2.tar.xz
 
 # Hash for license file:
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index ceb2f09d67..a68d96aa12 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -7,7 +7,7 @@
 VTE_VERSION_MAJOR = 0.66
 VTE_VERSION = $(VTE_VERSION_MAJOR).2
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
-VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
+VTE_SITE = https://download.gnome.org/sources/vte/$(VTE_VERSION_MAJOR)
 VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
 VTE_LICENSE = LGPL-3.0+
 VTE_LICENSE_FILES = COPYING.LGPL3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
