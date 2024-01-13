Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A48AC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362AD60F31;
	Sat, 13 Jan 2024 21:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362AD60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDrJWHHhPGTQ; Sat, 13 Jan 2024 21:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EF2460F10;
	Sat, 13 Jan 2024 21:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF2460F10
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7798D1BF868
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EAE341E0F
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EAE341E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SoqUw2o8c12x for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4677341E16
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4677341E16
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 374A286062; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:08:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3518dd952d20d64bc9cd24ebf025b4e7b575baf
X-Git-Newrev: 146cd5abb260a0be41a773ba4a33b32ca83f1e35
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.374A286062@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: bump to version 2.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=146cd5abb260a0be41a773ba4a33b32ca83f1e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/miniupnp/miniupnp/blob/miniupnpc_2_2_6/miniupnpc/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libminiupnpc/libminiupnpc.hash | 2 +-
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index db6b01f0c9..21dac02dd3 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38acd5f4602f7cf8bcdc1ec30b2d58db2e9912e5d9f5350dd99b06bfdffb517c  miniupnpc-2.2.5.tar.gz
+sha256  37fcd91953508c3e62d6964bb8ffbc5d47f3e13481fa54e6214fcc68704c66f1  miniupnpc-2.2.6.tar.gz
 sha256  e143c6e207d0bb874c4be76b57689ffa408063a37a735c6dcec3dc600cb522c5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 59b593cb36..dddbe6f81b 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.5
+LIBMINIUPNPC_VERSION = 2.2.6
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
