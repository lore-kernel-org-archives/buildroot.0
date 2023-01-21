Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA91C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DED6D82572;
	Mon, 20 Feb 2023 23:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DED6D82572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lh2Tt-r_o-oq; Mon, 20 Feb 2023 23:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271D181F7B;
	Mon, 20 Feb 2023 23:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 271D181F7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5B8C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C273A4175B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C273A4175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uV0mbJAarsaT for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E520841755
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E520841755
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DAB8648F; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 01e4f72b6bc8120437dd462673fdfccb4ef7df20
X-Git-Newrev: 2d7de5b2befe5a1703fbd583514aa46b457246d4
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.E2DAB8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/gsettings-desktop-schemas: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d7de5b2befe5a1703fbd583514aa46b457246d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash | 2 +-
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index d530517cd1..bad8eab91d 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.36/gsettings-desktop-schemas-3.36.1.sha256sum
+# From https://download.gnome.org/sources/gsettings-desktop-schemas/3.36/gsettings-desktop-schemas-3.36.1.sha256sum
 sha256  004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9  gsettings-desktop-schemas-3.36.1.tar.xz
 
 # Hash for license file
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 8573c75fde..b77397d565 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -7,7 +7,7 @@
 GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.36
 GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).1
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
-GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
+GSETTINGS_DESKTOP_SCHEMAS_SITE = https://download.gnome.org/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
 GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-pkgconf libglib2
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
