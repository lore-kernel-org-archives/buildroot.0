Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44758CCD1BF
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE31613F0;
	Wed, 22 Oct 2025 19:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OZcx_MHBZFx; Wed, 22 Oct 2025 19:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AB60613DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB60613DF;
	Wed, 22 Oct 2025 19:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9540B43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BEDF4068B
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYxJ_vWsQFOM for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F4540637
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F4540637
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D70487754; Wed, 22 Oct 2025 19:58:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 21:56:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00a38ca066f26bd9fb0a595523d6d42011dac316
X-Git-Newrev: 54c6c0125ac024bf5e99fc33e13d01bf58116a0a
X-Patchwork-Hint: ignore
Message-Id: <20251022195800.9D70487754@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: bump to version 3.24.51
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

commit: https://git.buildroot.net/buildroot/commit/?id=54c6c0125ac024bf5e99fc33e13d01bf58116a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 3.24.43, see:
https://gitlab.gnome.org/GNOME/gtk/-/blob/3.24.51/NEWS

Note: the "+" in the project name and source archive was removed
upstream. This commit updates _SOURCE and _SITE accordingly.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 6a682a7412..5394bb10cc 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.43.sha256sum
-sha256  7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7  gtk+-3.24.43.tar.xz
+# From https://download.gnome.org/sources/gtk/3.24/gtk-3.24.51.sha256sum
+sha256  0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f  gtk-3.24.51.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d6d7c64a54..be24869d3d 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).43
-LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
-LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).51
+LIBGTK3_SOURCE = gtk-$(LIBGTK3_VERSION).tar.xz
+LIBGTK3_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
 LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
