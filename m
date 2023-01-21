Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F8DC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D3261102;
	Tue, 21 Feb 2023 01:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D3261102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twcv_e1Oh961; Tue, 21 Feb 2023 01:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97CA6118A;
	Tue, 21 Feb 2023 01:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C97CA6118A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D40381BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7FD46FBAB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FD46FBAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhW29yWk4byU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 146316FB83
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 146316FB83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1093E81979; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb96dcaff49c259ad02fad428ab3ae3d210416e4
X-Git-Newrev: 30b916546b7c5000130db461880e7d21b5741952
X-Patchwork-Hint: ignore
Message-Id: <20230220205238.1093E81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gtkmm3: switch to
 https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=30b916546b7c5000130db461880e7d21b5741952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtkmm3/gtkmm3.hash | 2 +-
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index 26687507f4..fc7e33339e 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
+# From https://download.gnome.org/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
 sha256  05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5  gtkmm-3.22.0.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 009889142e..d717c08bd8 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -7,7 +7,7 @@
 GTKMM3_VERSION_MAJOR = 3.22
 GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
-GTKMM3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
+GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
