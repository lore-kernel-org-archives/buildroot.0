Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98425C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8A660A9D;
	Mon,  3 Jul 2023 18:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8A660A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TdWV-K65eYy; Mon,  3 Jul 2023 18:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8566B60AB9;
	Mon,  3 Jul 2023 18:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8566B60AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5761BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA6060A7E
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA6060A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgpiUNvBAjfH for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D9DB60A9B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9DB60A9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB4686441; Mon,  3 Jul 2023 18:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:43:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83cc31689655da15754a3e873b10857ba37877ba
X-Git-Newrev: 9d9c384ac180f04fa546a268d99cd74f88972083
X-Patchwork-Hint: ignore
Message-Id: <20230703184521.1BB4686441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: bump to version 2.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d9c384ac180f04fa546a268d99cd74f88972083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.5.tar.gz

Updated license hash due to reformat of license file:
https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 5dca8dd6cf..db6b01f0c9 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  481a5e4aede64e9ef29895b218836c3608d973e77a35b4f228ab1f3629412c4b  miniupnpc-2.2.4.tar.gz
-sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
+sha256  38acd5f4602f7cf8bcdc1ec30b2d58db2e9912e5d9f5350dd99b06bfdffb517c  miniupnpc-2.2.5.tar.gz
+sha256  e143c6e207d0bb874c4be76b57689ffa408063a37a735c6dcec3dc600cb522c5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 9dc5c719a9..59b593cb36 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.4
+LIBMINIUPNPC_VERSION = 2.2.5
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
