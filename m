Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A04FC71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A8360EDA;
	Sun, 15 Jun 2025 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EtVNbvmlyjY; Sun, 15 Jun 2025 20:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6A160D8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B6A160D8F;
	Sun, 15 Jun 2025 20:30:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E4F31A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C11401EC
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GalKWAyLvmkd for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B89E401E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B89E401E9
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33A0383A8C; Sun, 15 Jun 2025 20:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c675522f55e98ec85a9fac7e8c5839155a39f75e
X-Git-Newrev: e2bd1593d0f144164e678d666276e0fc290c829f
X-Patchwork-Hint: ignore
Message-Id: <20250615203011.33A0383A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs-router: bump to version 4.5.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2bd1593d0f144164e678d666276e0fc290c829f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 4.4.5, see:
https://github.com/vuejs/router/blob/v4.5.1/packages/router/CHANGELOG.md

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 83c14e8823..299ca61649 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f114198b1efb7635c281cb191948f6ed1cecfa9a9e9be2c14d5356cd624eb60  vue-router-4.4.5.tgz
+sha256  093fee5133cf82e75d25940d86f58a4e3f194b74262205ff5c1926aed53339c4  vue-router-4.5.1.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 7de4864d3f..a6d9df6dc2 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.4.5
+VUEJS_ROUTER_VERSION = 4.5.1
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
