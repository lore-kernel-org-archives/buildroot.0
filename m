Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F99CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60E981A2B;
	Sun,  9 Jan 2022 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TS_34SlLE0uk; Sun,  9 Jan 2022 15:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 276638177C;
	Sun,  9 Jan 2022 15:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1B11BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E85740167
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OO8rHSmF4RfU for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE97040352
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC30982DC2; Sun,  9 Jan 2022 14:53:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e89b555a4d20799990f954d545d180832bb3cd05
X-Git-Newrev: 490d8b13b16f32d23fc69ebf00ac1c98d9f523e1
X-Patchwork-Hint: ignore
Message-Id: <20220109145350.EC30982DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-av: bump to version 0.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=490d8b13b16f32d23fc69ebf00ac1c98d9f523e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp-av/gupnp-av.hash | 4 ++--
 package/gupnp-av/gupnp-av.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 570f8ab3d0..ceab42ef52 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.13/gupnp-av-0.13.0.sha256sum:
-sha256  578b8f562b0f7e908416a41efbe2b7e6b892cd2ed7eac61ac63c48fdc8d7e6c8  gupnp-av-0.13.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
+sha256  20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156  gupnp-av-0.14.0.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index c2d3c3ba18..655de87608 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUPNP_AV_VERSION_MAJOR = 0.13
+GUPNP_AV_VERSION_MAJOR = 0.14
 GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
