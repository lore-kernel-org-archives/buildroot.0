Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1A5C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E33F861107;
	Tue, 21 Feb 2023 01:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33F861107
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL-U0_QBEv-c; Tue, 21 Feb 2023 01:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E29611B9;
	Tue, 21 Feb 2023 01:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E29611B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C118F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9CAB6FB80
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CAB6FB80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ue1bozd_Qokx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5B5C6FB98
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B5C6FB98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6F8281979; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:53:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2334adaa974a7984a4bd3a9cf65e2187d25d8b2d
X-Git-Newrev: 01e4f72b6bc8120437dd462673fdfccb4ef7df20
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.D6F8281979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gobject-introspection:
 switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=01e4f72b6bc8120437dd462673fdfccb4ef7df20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/gobject-introspection.hash | 2 +-
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 8f9d323d9a..fa3fdfe306 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,4 +1,4 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.72.0.sha256sum
+#From https://download.gnome.org/sources/gobject-introspection/1.72/gobject-introspection-1.72.0.sha256sum
 sha256  02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc  gobject-introspection-1.72.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 12e5b81b1b..37e1b2c64a 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -6,7 +6,7 @@
 
 GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.72
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
-GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
+GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
 GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
