Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B48C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A0160F57;
	Mon, 11 Jul 2022 17:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A0160F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLD353z4kwHP; Mon, 11 Jul 2022 17:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E8C60F51;
	Mon, 11 Jul 2022 17:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55E8C60F51
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E35C71BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838CA60F44
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838CA60F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09Yhby6cBZuK for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6123460F51
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6123460F51
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 91114837E8; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:27:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b3067072b949ec29aea79a9f5288d265890e493d
X-Git-Newrev: 41690b67199545b6319f164fd8d8beffed4422f5
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.91114837E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgtk3: bump to
 version 3.24.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=41690b67199545b6319f164fd8d8beffed4422f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c253f8498222a8446ce9da4a900acd0b345df289)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 23ce1f42bb..c68c6e90f6 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
-sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801  gtk+-3.24.33.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
+sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec  gtk+-3.24.34.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index cd0a75eb23..53d7f6898a 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
