Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EBAC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED44E40811;
	Thu,  9 May 2024 20:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PECv3hZIyGV2; Thu,  9 May 2024 20:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8310B41FC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8310B41FC9;
	Thu,  9 May 2024 20:11:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC84F1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A834241DEA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3QIS16v9VSP for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D3B402C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D3B402C3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFD5386D78; Thu,  9 May 2024 20:11:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:10:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 157b9d1199f9f1101e76aedc552cfa524990acd6
X-Git-Newrev: 415398960f3d1c48d3610ce1b47bb8d37d17bfa3
X-Patchwork-Hint: ignore
Message-Id: <20240509201150.DFD5386D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: bump to 1.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=415398960f3d1c48d3610ce1b47bb8d37d17bfa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announce:
  http://lists.freedesktop.org/archives/wayland-devel/2024-March/043537.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043572.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 58c432e365..93d40a919c 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html
-sha256  94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a  wayland-protocols-1.33.tar.xz
-sha512  4584f6ac86367655f9db5d0c0ed0681efa31e73f984e4b620fbe5317df21790927f4f5317ecbbc194ac31eaf88caebc431bcc52c23d9dc0098c71de3cb4a9fef  wayland-protocols-1.33.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043581.html
+sha256  71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92  wayland-protocols-1.36.tar.xz
+sha512  5448b9aedc953ce6be0f378da900c195c8743cb6001f615823b5fc9cab3e3ee54271132055743278e10decef7f8e9dcdeef31593a2a12062575fb90eb0084be0  wayland-protocols-1.36.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 50a08d1988..c0dfe69401 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.33
+WAYLAND_PROTOCOLS_VERSION = 1.36
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
