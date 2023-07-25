Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C8C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0201C418A7;
	Tue, 25 Jul 2023 21:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0201C418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZPNdoTRzDed; Tue, 25 Jul 2023 21:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC9D0418C5;
	Tue, 25 Jul 2023 21:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9D0418C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF5D61BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FDB8214C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95FDB8214C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JyU-hxDFvT0 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60BB8214B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C60BB8214B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B079682DD2; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 22:59:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6daa5562fe6cf86fdefc261a6e03200731c00151
X-Git-Newrev: 7cb2f7d236f15ce9178b51c915086b7a547512e6
X-Patchwork-Hint: ignore
Message-Id: <20230725210022.B079682DD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: bump to version 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cb2f7d236f15ce9178b51c915086b7a547512e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 1c7fe705e1..5da527e318 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042268.html
-sha256  6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac  wayland-1.21.0.tar.xz
-sha512  5575216d30fdf5c63caa6bcad071e15f2a4f3acb12df776806073f65db37a50b5b5b3cc7957c5497636f4ac01893e2eaab26e453ded44b287acde01762f5fdc3  wayland-1.21.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-April/042647.html
+sha256  1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842  wayland-1.22.0.tar.xz
+sha512  fb1974efc8433e97254eb83fe28974198f2b4d8246418eb3d34ce657055461e0c97bc06dd52e5066ae91bbe05bac611dc49a0937ba226ac6388d5a47241efb12  wayland-1.22.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 0a6e5e9ec7..1a764d5580 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.21.0
+WAYLAND_VERSION = 1.22.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
