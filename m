Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE6CCA472
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF7060E2D;
	Tue, 30 Sep 2025 20:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsIrLalxval3; Tue, 30 Sep 2025 20:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25AFA6106C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25AFA6106C;
	Tue, 30 Sep 2025 20:04:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC082A6
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F43140CD2
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5PCWZg3oWYR for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63DA40234
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A63DA40234
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:04:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9567E86634; Tue, 30 Sep 2025 20:04:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 22:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78a8491d81f10c4ed19c12f3b29b64af1db1b843
X-Git-Newrev: ed8318f6eca8ce2ea54e192857d5282c093ebd3a
X-Patchwork-Hint: ignore
Message-Id: <20250930200451.9567E86634@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: bump to version
 2025.05.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed8318f6eca8ce2ea54e192857d5282c093ebd3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2025.05.28. See release note:
https://github.com/usbarmory/crucible/releases/tag/v2025.05.28

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index 959dc89286..0ec297c49d 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  466b7b0be8b5085d669d63cca2a80f04c6dcbdd887a51333532ecb804a6b74ca  crucible-2023.11.02-go2.tar.gz
+sha256  6912697626baf47b21ceb620eb2885bf0fea8a1657a9d0046d11c148289109e2  crucible-2025.05.28-go2.tar.gz
 sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 5eedbca8ee..9b34cc52d9 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = 2023.11.02
+CRUCIBLE_VERSION = 2025.05.28
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
