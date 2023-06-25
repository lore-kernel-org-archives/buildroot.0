Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38EDEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD0841512;
	Sun, 25 Jun 2023 15:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD0841512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miyalkYPJqOo; Sun, 25 Jun 2023 15:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D29141517;
	Sun, 25 Jun 2023 15:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D29141517
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5801B1BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2D34151B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2D34151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyfTZ1-kDWDm for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA66C409A1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA66C409A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCF7D84AE2; Sun, 25 Jun 2023 15:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:41:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f722cf6dbbf23850da7b10e1d94e156ff5419d7
X-Git-Newrev: f67fae131eecb789825480bf1d9a85c96e454d2c
X-Patchwork-Hint: ignore
Message-Id: <20230625150109.BCF7D84AE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_setxkbmap: bump version
 to 1.3.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f67fae131eecb789825480bf1d9a85c96e454d2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash | 6 +++---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
index a57d7cc737..a3ad6ce38c 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003146.html
-sha256  b560c678da6930a0da267304fa3a41cc5df39a96a5e23d06f14984c87b6f587b  setxkbmap-1.3.3.tar.xz
-sha512  208f07a7f7bce47b573099d4cd8c941a3a4d74b456720bc3ca1cbba298381a2ab98c7500d6e6cd6d5dd61840b7c42cf6521da754ec395f266f8158102a55ad58  setxkbmap-1.3.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003397.html
+sha256  be8d8554d40e981d1b93b5ff82497c9ad2259f59f675b38f1b5e84624c07fade  setxkbmap-1.3.4.tar.xz
+sha512  f4d026e7707656173f54d79b95ff3370ae06eaf252b89b79bc7175edeaf3ef79073d4d7d8a35fdee95608bf85d7d23514d74f00e55b613810ef6c3ccc0cf498b  setxkbmap-1.3.4.tar.xz
 # Locally computed
 sha256  afb8ce58340b6a6b85b73e256425263ce46f5a427279785e275991cb660cce82  COPYING
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 4d48a3fbc1..9049b36944 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.3.3
+XAPP_SETXKBMAP_VERSION = 1.3.4
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.xz
 XAPP_SETXKBMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SETXKBMAP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
