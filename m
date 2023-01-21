Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F495C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0813C82201;
	Sat, 21 Jan 2023 13:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0813C82201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgi8VZHg65a6; Sat, 21 Jan 2023 13:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412C8821AD;
	Sat, 21 Jan 2023 13:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412C8821AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 275C61BF40B
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 936EA408D1
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936EA408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvXoyHBJ2b-b for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99044404AE
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99044404AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8687586948; Sat, 21 Jan 2023 13:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:53:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbad80aeb21d9657d85b722b02fdf3e66decfb8d
X-Git-Newrev: 2334adaa974a7984a4bd3a9cf65e2187d25d8b2d
X-Patchwork-Hint: ignore
Message-Id: <20230121131609.8687586948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm: switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=2334adaa974a7984a4bd3a9cf65e2187d25d8b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibmm/glibmm.hash | 2 +-
 package/glibmm/glibmm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index f0bc7f4e71..ea256c3add 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
+# From https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
 sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 525da6b618..7f37da8449 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -9,7 +9,7 @@ GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
+GLIBMM_SITE = https://download.gnome.org/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
 GLIBMM_INSTALL_STAGING = YES
 GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
 GLIBMM_CONF_OPTS = -Dbuild-examples=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
