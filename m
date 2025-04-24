Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05EAC369D5
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 21:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5E542D67;
	Thu, 24 Apr 2025 21:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loqODuDNe40J; Thu, 24 Apr 2025 21:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A748642D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A748642D56;
	Thu, 24 Apr 2025 21:31:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB23D159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C770E60EC1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saZChfgJjWkJ for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EEB60A5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27EEB60A5F
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14553863E5; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Apr 2025 23:01:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1896f8c7583f40652c212d2c5ded8c91b98873c4
X-Git-Newrev: 585cf21fa91147fe30ee48cdfef540bd7c9dd768
X-Patchwork-Hint: ignore
Message-Id: <20250424213059.14553863E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libecoli: bump version to 0.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=585cf21fa91147fe30ee48cdfef540bd7c9dd768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version is required to compile grout v8.4.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 433550f91b..f973b6f254 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
+sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f260467d1f..f989e7b9cd 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.3.0
+LIBECOLI_VERSION = 0.5.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
