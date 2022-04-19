Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88393C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3920C4097F;
	Tue, 19 Apr 2022 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hKxpZ0EB3tg; Tue, 19 Apr 2022 20:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 504A0408EF;
	Tue, 19 Apr 2022 20:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B32D31BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A16B060AB0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bkwd1uSAD6T for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:35:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7CE760AA8
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 469D283DEA; Tue, 19 Apr 2022 20:25:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 22:35:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ec4824aa486c3b9fe91b68d224300099cdac0c1
X-Git-Newrev: f868f7ba9308aeb0e4586d63557d9da253d0da0b
X-Patchwork-Hint: ignore
Message-Id: <20220419202542.469D283DEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: bump to 903b6fc
 (v5.2.2.4 branch HEAD)
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

commit: https://git.buildroot.net/buildroot/commit/?id=f868f7ba9308aeb0e4586d63557d9da253d0da0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to build against newer kernels (up to 5.18).
Tested on kernel v5.15.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 37767f5d16..9c7f2de4b6 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2b06c842bccd730d68a26b1c1b5a24f18373401e907147bf5e775fa42a36bbb  rtl8188eu-60cb0b5a3cfc95e3f2e6fc294a28d987096b0559.tar.gz
+sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index b2066080f3..fa420b0d57 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 60cb0b5a3cfc95e3f2e6fc294a28d987096b0559
+RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
