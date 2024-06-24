Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F459C30653
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 19:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB31960A83;
	Mon, 24 Jun 2024 19:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UDuOntbBIZQ; Mon, 24 Jun 2024 19:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5314060AD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5314060AD9;
	Mon, 24 Jun 2024 19:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE9981BF95F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA907408D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGbnunHB0daW for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 19:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949B1408A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 949B1408A2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 19:26:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ADDD82B63; Mon, 24 Jun 2024 19:26:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:25:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c452e5ac11a83cc130edfbe6ffccc8101142d378
X-Git-Newrev: 4f21835ff05f1707b45edf90cca2ac2501b3033f
X-Patchwork-Hint: ignore
Message-Id: <20240624192654.8ADDD82B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to version
 2024-05-19
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f21835ff05f1707b45edf90cca2ac2501b3033f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 2746194f43..5ed0bbd376 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189fs-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
+sha256  a5063b1554acd08bcc084926d1ff80148fe8521a6aefb7061cae68b7c4a7cdb1  rtl8189fs-9a82349c2c40515f9d20b9f6721670f76b4e1c7a.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 174bb346ca..afb8685bac 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
+RTL8189FS_VERSION = 9a82349c2c40515f9d20b9f6721670f76b4e1c7a
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
