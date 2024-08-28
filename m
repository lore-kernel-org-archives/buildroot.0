Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9AC54755
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 09:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CFF240B1A;
	Wed, 28 Aug 2024 09:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xQDZzOQpeLS; Wed, 28 Aug 2024 09:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B303C4062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B303C4062A;
	Wed, 28 Aug 2024 09:20:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EECA71BF3F9
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E789080CD1
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fLX1e5XjtM9 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 09:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA6480CBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDA6480CBC
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 09:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB047865D2; Wed, 28 Aug 2024 09:20:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 11:09:39 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: bfc86676cf8c1e0fbb27534fb237783684f3f6e0
X-Git-Newrev: 4b00891da14eb67f5390a5650c0cf96e7f84cb07
X-Patchwork-Hint: ignore
Message-Id: <20240828092014.BB047865D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libgtk3: bump to
 version 3.24.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b00891da14eb67f5390a5650c0cf96e7f84cb07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d40e57e945e8348f74d0228e00c9424ce3bfb68a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 0fa4873443..a1d8b1694d 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.41.sha256sum
-sha256  47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7c8988bd651b6fa  gtk+-3.24.41.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.42.sha256sum
+sha256  50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a94725e2de112377e2  gtk+-3.24.42.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7e5882f830..547fd194a5 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).41
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).42
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
