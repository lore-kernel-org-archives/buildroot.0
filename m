Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50010D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 16:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11C7831E7;
	Sat, 29 Nov 2025 16:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JC_wGkg9OTf; Sat, 29 Nov 2025 16:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA33E83279
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA33E83279;
	Sat, 29 Nov 2025 16:41:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 185EB708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 043C2606C4
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63LI0On9QnZW for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 16:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3B1606BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C3B1606BF
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3747B86022; Sat, 29 Nov 2025 16:41:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 17:14:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d06976eeb02c2fa4f28141ef3b6e92f9f499f69d
X-Git-Newrev: a9e7472d6c8a6220bff9ce51f3188158ba930e7e
X-Patchwork-Hint: ignore
Message-Id: <20251129164122.3747B86022@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sbc: bump version to
 2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9e7472d6c8a6220bff9ce51f3188158ba930e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/ChangeLog?h=2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sbc/sbc.hash | 2 +-
 package/sbc/sbc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
index b080c06205..313551101a 100644
--- a/package/sbc/sbc.hash
+++ b/package/sbc/sbc.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
-sha256  8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992  sbc-2.0.tar.xz
+sha256  426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2  sbc-2.1.tar.xz
 
 # sha256 locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 7a37a99643..62f481be3a 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SBC_VERSION = 2.0
+SBC_VERSION = 2.1
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
