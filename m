Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91318CDD0E1
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1510403D9;
	Tue, 22 Oct 2024 20:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYtcBuLmzjCj; Tue, 22 Oct 2024 20:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA07404E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA07404E1;
	Tue, 22 Oct 2024 20:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B1659F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE6680ECF
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWobcKFevVUT for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAFBE80EBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAFBE80EBD
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:24:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B76D7861D6; Tue, 22 Oct 2024 20:24:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 21:32:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43421b8c02d3a30ae1b366dd3e3d6d4f1ec4de17
X-Git-Newrev: 1a063dfafddfad8ce5812f9a9fe3ef0227b4d4bd
X-Patchwork-Hint: ignore
Message-Id: <20241022202455.B76D7861D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: bump to version 1.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a063dfafddfad8ce5812f9a9fe3ef0227b4d4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 66bb5282f4..3472494355 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf8ca9382a17564ceedadf8fe574cd7c73440cd298d2adfbe88fa452427f8526  libzenoh-c-0.11.0-cargo2.tar.gz
+sha256  80e3144ebd82bdbfb43ff10e7f22047826adbbe0d0ed0081b215924a6c1bdb6c  libzenoh-c-1.0.0-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index f07206f4f7..c474d98b07 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This 0.11.0 version is really newer than 0.11.0.3, so please don't
-# update 0.11.0.3 even if release-monitoring.org claims it's a newer
+# This 1.0.0 version is really newer than 1.0.0.12, so please don't
+# update 1.0.0 even if release-monitoring.org claims it's a newer
 # version.
-LIBZENOH_C_VERSION = 0.11.0
+LIBZENOH_C_VERSION = 1.0.0
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
