Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97165C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D8F404AE;
	Sat, 21 Jan 2023 13:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42D8F404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmpcJrLJvbvr; Sat, 21 Jan 2023 13:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853C34048A;
	Sat, 21 Jan 2023 13:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853C34048A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA8BB1BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A738341C9D
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A738341C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSg0A6yLFdAl for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92FB041CA1
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FB041CA1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F9B386946; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:53:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2334adaa974a7984a4bd3a9cf65e2187d25d8b2d
X-Git-Newrev: 01e4f72b6bc8120437dd462673fdfccb4ef7df20
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.8F9B386946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: switch to
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

commit: https://git.buildroot.net/buildroot/commit/?id=01e4f72b6bc8120437dd462673fdfccb4ef7df20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
