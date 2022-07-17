Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBAAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB2660F2F;
	Sun, 17 Jul 2022 13:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB2660F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngAZtr4NkrI6; Sun, 17 Jul 2022 13:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B4C60EC0;
	Sun, 17 Jul 2022 13:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06B4C60EC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7DFA1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C30C9840B9
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30C9840B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zHQLftOdeQW for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD558333E
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD558333E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CD5F483BCC; Sun, 17 Jul 2022 13:06:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:15:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d07edd1e4f4e790196bf31f87e071aa9de1cc789
X-Git-Newrev: f6506162c41d8cc2c18f3b07aff2ce483e1b2f88
X-Patchwork-Hint: ignore
Message-Id: <20220717130654.CD5F483BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-tools: bump to version 0.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6506162c41d8cc2c18f3b07aff2ce483e1b2f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gupnp-tools/gupnp-tools.hash | 4 ++--
 package/gupnp-tools/gupnp-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 28a1d26ede..37983b0c92 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
-sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
+sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 7b34de52a0..96bcbffa49 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
