Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C114CEACEF
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1029860747;
	Sun, 16 Nov 2025 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fPb5cRxnRzN; Sun, 16 Nov 2025 16:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37CA660683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CA660683;
	Sun, 16 Nov 2025 16:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4697D158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E397860683
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjjHjCVeUkoO for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 16:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BEDB606BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BEDB606BE
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 16:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 043F283F52; Sun, 16 Nov 2025 16:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 11:41:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 621da9d96167c852a984ac444529751f18d2366d
X-Git-Newrev: 0289d61dfab7d3c4fa5ada72eb9db1bce9fbee87
X-Patchwork-Hint: ignore
Message-Id: <20251116164823.043F283F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: bump to version 2.4.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0289d61dfab7d3c4fa5ada72eb9db1bce9fbee87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release depends on libyang (v3.13.6), libnetconf2 (v3.7.10) and
sysrepo (v3.7.11).

See https://github.com/CESNET/netopeer2/releases/tag/v2.4.5
for the changes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: change release notes link to point on exact release]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 3a70b15539..e87aebf0bf 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed9567d  netopeer2-2.4.1.tar.gz
+sha256  63d42493752062e7dfb3d3aca9c4157f49298401bdc5cd5166975f2cbc5f6f1b  netopeer2-2.4.5.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 71f2c50640..543dfdfa33 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.4.1
+NETOPEER2_VERSION = 2.4.5
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
