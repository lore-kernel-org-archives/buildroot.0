Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0406FC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA6C6085C;
	Thu, 17 Jul 2025 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk_w4nH1kUA4; Thu, 17 Jul 2025 20:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D66C607E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D66C607E3;
	Thu, 17 Jul 2025 20:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2384A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9591608A2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIC9-h-pFOcB for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0864A607DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0864A607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAAE586746; Thu, 17 Jul 2025 20:43:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:31:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5128711e33d912fd090e8280c3a1ad0d138a90b
X-Git-Newrev: 5716dc98918ab4749ab6b133546478154bcf3d99
X-Patchwork-Hint: ignore
Message-Id: <20250717204324.EAAE586746@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjcat: bump to version 0.2.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5716dc98918ab4749ab6b133546478154bcf3d99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libjcat/libjcat.hash | 2 +-
 package/libjcat/libjcat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
index b6dc8d2f69..8f50f8798f 100644
--- a/package/libjcat/libjcat.hash
+++ b/package/libjcat/libjcat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
+sha256  f2f115aad8a8f16b8dde1ed55de7abacb91d0878539aa29b2b60854b499db639  libjcat-0.2.3.tar.xz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
index c365c1914b..4a7f304c2a 100644
--- a/package/libjcat/libjcat.mk
+++ b/package/libjcat/libjcat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJCAT_VERSION = 0.2.1
+LIBJCAT_VERSION = 0.2.3
 LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
 LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
 LIBJCAT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
