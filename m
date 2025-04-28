Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B6FC369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 20:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F3440849;
	Mon, 28 Apr 2025 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMzY1mK6Ix1y; Mon, 28 Apr 2025 20:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23D140832
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C23D140832;
	Mon, 28 Apr 2025 20:19:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A88913D
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C8F34082D
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNRR13Hx1OnU for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 20:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF39C40813
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF39C40813
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:19:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A184D863D9; Mon, 28 Apr 2025 20:19:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Apr 2025 22:12:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78d38611730942db4636fd8a57b71521369faa0a
X-Git-Newrev: de3e07d6fd9a452c58071024cbc539b5c6f7a526
X-Patchwork-Hint: ignore
Message-Id: <20250428201900.A184D863D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: bump to version 2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=de3e07d6fd9a452c58071024cbc539b5c6f7a526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/libexpat/libexpat/blob/R_2_7_1/expat/Changes

Update hash of the COPYING file (year updated):
https://github.com/libexpat/libexpat/commit/2b2a24691a9888e0f3c179b8f05cbacb19f460ef

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 4975d0f864..87bbf86e1a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25df13dd2819e85fb27a1ce0431772b7047d72af81ae78dc26b4c6e0805f48d1  expat-2.7.0.tar.xz
-sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
+sha256  354552544b8f99012e5062f7d570ec77f14b412a3ff5c7d8d0dae62c0d217c30  expat-2.7.1.tar.xz
+sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5d40133f08..51b45b01bb 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.0
+EXPAT_VERSION = 2.7.1
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
