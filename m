Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04D2C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E2F605CF;
	Sun, 21 Jul 2024 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHuGZ0wtWABS; Sun, 21 Jul 2024 16:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9212605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9212605D4;
	Sun, 21 Jul 2024 16:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD2C1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F158340308
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id np81KFYzZEnW for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0491240301
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0491240301
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:33:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F381286F53; Sun, 21 Jul 2024 16:33:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:32:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4a84e61615553ff678d3c3b52ed33f898e9fcc9
X-Git-Newrev: 998c12bc1567a27f5e55035af80f1eb95f0b078c
X-Patchwork-Hint: ignore
Message-Id: <20240721163355.F381286F53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mxt-app: bump to version 1.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=998c12bc1567a27f5e55035af80f1eb95f0b078c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.38

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mxt-app/mxt-app.hash | 2 +-
 package/mxt-app/mxt-app.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
index b7851cea37..2f5ea814d8 100644
--- a/package/mxt-app/mxt-app.hash
+++ b/package/mxt-app/mxt-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  mxt-app-1.36.tar.gz
+sha256  38fdf7954d2184d122f6f1b1493fba1955c0e3c7dfd5196dbc3d536afc9c672a  mxt-app-1.38.tar.gz
 sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
index 3da1458978..4921803e4c 100644
--- a/package/mxt-app/mxt-app.mk
+++ b/package/mxt-app/mxt-app.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXT_APP_VERSION = 1.36
+MXT_APP_VERSION = 1.38
 MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
 MXT_APP_LICENSE = BSD-2-Clause
 MXT_APP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
