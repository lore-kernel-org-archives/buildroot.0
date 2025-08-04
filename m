Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA87C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE52613A1;
	Mon,  4 Aug 2025 20:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_vkzNyJzspO; Mon,  4 Aug 2025 20:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2813A60745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2813A60745;
	Mon,  4 Aug 2025 20:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 858B21A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8391260AF2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSjI9XSWEEwW for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD20A60701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD20A60701
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C604A86EA0; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Aug 2025 22:11:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e4be3a5be263d01d92edc02004d4ce138cba696
X-Git-Newrev: 2fd520c8d52b9e0ed5e26343813fdd8dbcadb45f
X-Patchwork-Hint: ignore
Message-Id: <20250804201258.C604A86EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glm: bump version to 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fd520c8d52b9e0ed5e26343813fdd8dbcadb45f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/g-truc/glm/releases/tag/1.0.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 0084bd0930..a9f4c9ee7f 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23  glm-1.0.0.tar.gz
+sha256  9f3174561fd26904b23f0db5e560971cbf9b3cbda0b280f04d5c379d03bf234c  glm-1.0.1.tar.gz
 sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ce8efc11a7..b2e13f09bb 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 1.0.0
+GLM_VERSION = 1.0.1
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
