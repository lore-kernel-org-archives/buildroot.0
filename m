Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E2C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755AE60B0E;
	Mon, 21 Apr 2025 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P74Jxb3ViJNg; Mon, 21 Apr 2025 15:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC24C6059E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC24C6059E;
	Mon, 21 Apr 2025 15:36:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D78068
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E11C260AF6
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axEYoh-Q_0Q7 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 15:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E3760AEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E3760AEC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4C6C85FA6; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:26:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9b0e551afa04c347761d0b9459a106f2c9b8e5e
X-Git-Newrev: 9021b261c6085bd4e1258aa23c8424198dd6d59f
X-Patchwork-Hint: ignore
Message-Id: <20250421153610.E4C6C85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hyperfine: bump version to 1.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9021b261c6085bd4e1258aa23c8424198dd6d59f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/sharkdp/hyperfine/blob/v1.19.0/CHANGELOG.md

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 88b8710125..3590d91133 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6cbe5673729ba7fd7a1b0b19a54630f93f4fcc29ea7878845f17931d31cd16fb  hyperfine-1.18.0-cargo2.tar.gz
+sha256  805a1be8dc1667591988ac6ca1ac4fc37408a46a077b4e2332e0a81cc4a3d2e1  hyperfine-1.19.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index b9f09a2820..7ab25fd4f1 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.18.0
+HYPERFINE_VERSION = 1.19.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
