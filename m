Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB8C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C56960862;
	Mon, 29 Jul 2024 18:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiD_n8MTOsQT; Mon, 29 Jul 2024 18:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B0660887
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B0660887;
	Mon, 29 Jul 2024 18:00:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B42A1BF267
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159DC40236
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAn8VcM9KAki for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154524012A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154524012A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:59:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02F7782C83; Mon, 29 Jul 2024 17:59:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 19:57:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e08708451be9e964b5a8e3a5a6f0959ad5e7c6a0
X-Git-Newrev: 427562543d0063b558d58182f6af766ff1ce92b4
X-Patchwork-Hint: ignore
Message-Id: <20240729175956.02F7782C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafnode2: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=427562543d0063b558d58182f6af766ff1ce92b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leafnode2/leafnode2.hash | 2 +-
 package/leafnode2/leafnode2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 8ab57c93c7..9c86173ae1 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2a72a405599cd9f01cd44b6655c8986bf589b1f766c32957a70c147e39177a30  leafnode2-c514997a8c50bd28a34893d0436b0330f5719238.tar.gz
+sha256  42f2185f29a74f683a962e9cf6e38bc5f8a342d0dde8b6a03457a165365e3445  leafnode2-9543ffaf82406f943d449d522d88baa554515e0f.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 71b27f180c..566aaf3d55 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = c514997a8c50bd28a34893d0436b0330f5719238
+LEAFNODE2_VERSION = 9543ffaf82406f943d449d522d88baa554515e0f
 LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
