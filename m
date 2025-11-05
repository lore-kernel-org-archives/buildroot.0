Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5CCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 113198068F;
	Wed,  5 Nov 2025 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqOpOzq_O3wW; Wed,  5 Nov 2025 20:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52DA803A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D52DA803A7;
	Wed,  5 Nov 2025 20:34:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DECF4C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EEFA613CC
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn_bW8shCm7v for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37813613C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37813613C4
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24B0383D43; Wed,  5 Nov 2025 20:34:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 21:32:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96ffbbca8f893b0bbd2f34e440812fb729d0b434
X-Git-Newrev: 080e09775e812ba85f13991abdcff43d5f235322
X-Patchwork-Hint: ignore
Message-Id: <20251105203422.24B0383D43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/umtprd: bump to version 1.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=080e09775e812ba85f13991abdcff43d5f235322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.8.1/Release-notes.txt

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/umtprd/umtprd.hash | 2 +-
 package/umtprd/umtprd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index f682dd6d84..3502d5f1ef 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e0b3c308016595a5d956eaaa086d3bfe4c9af2270857181695338df9affb3574  umtprd-1.6.8.tar.gz
+sha256  6f57f61a1993059bcdd5f598d8c2a3888991497ef42ba3594947f00bd7746b1f  umtprd-1.8.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 1f1f6bcd23..1a2b387219 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.6.8
+UMTPRD_VERSION = 1.8.1
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
