Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817ECE7A9C
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E2D8400AE;
	Thu,  5 Sep 2024 20:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnSCkEDsrFlH; Thu,  5 Sep 2024 20:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B5F40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24B5F40391;
	Thu,  5 Sep 2024 20:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1681BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E85E940391
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9pKKG0oNaPn for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE636400AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE636400AE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F6E86E58; Thu,  5 Sep 2024 20:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:49:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3a88abeb72b3a4d1137fb1ad5dc6e4ddae119e9
X-Git-Newrev: e3f464778945d3e7ed31c50d07de02fb2cd85464
X-Patchwork-Hint: ignore
Message-Id: <20240905205538.C5F6E86E58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsoup3: bump to 3.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3f464778945d3e7ed31c50d07de02fb2cd85464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

News:
 - https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.2.news
 - https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.news

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 139771a11e..37ecd2db84 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.sha256sum
-sha256  c1d7cfb89832d35c271f37d544f2cfe21fa60ae9faad4a7ac58996ae4031f7ba  libsoup-3.5.1.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.6/libsoup-3.6.0.sha256sum
+sha256  62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3  libsoup-3.6.0.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index bc3ae4d0cb..f8a7e26159 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP3_VERSION_MAJOR = 3.5
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).1
+LIBSOUP3_VERSION_MAJOR = 3.6
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).0
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
