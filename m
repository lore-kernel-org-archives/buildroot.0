Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F24C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3DE81AF4;
	Mon,  1 Jul 2024 07:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApsezCUSKfa4; Mon,  1 Jul 2024 07:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352FF817AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352FF817AC;
	Mon,  1 Jul 2024 07:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADDA1BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14E044029F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfiNvq51ufcJ for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25E0E40543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25E0E40543
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F71C8376C; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jul 2024 09:10:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 224067105db10ad00ad1e7b2eb6444732323eb65
X-Git-Newrev: 020c7bd205fcbb4a8eb27b52f24c0c9f030fe6de
X-Patchwork-Hint: ignore
Message-Id: <20240701071151.7F71C8376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: bump to 1.23.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=020c7bd205fcbb4a8eb27b52f24c0c9f030fe6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043625.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043614.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043580.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 5da527e318..627cb5a1b0 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-April/042647.html
-sha256  1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842  wayland-1.22.0.tar.xz
-sha512  fb1974efc8433e97254eb83fe28974198f2b4d8246418eb3d34ce657055461e0c97bc06dd52e5066ae91bbe05bac611dc49a0937ba226ac6388d5a47241efb12  wayland-1.22.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
+sha256  05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2  wayland-1.23.0.tar.xz
+sha512  9c525231a7ea3e68d3178230d476285a960d23e38571ac96d885f86c0588c52ef01460bff6833db5adb9456ce8db7b996613611187aac972736748ba91b8fd81  wayland-1.23.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 1a764d5580..06adafc3e1 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.22.0
+WAYLAND_VERSION = 1.23.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
