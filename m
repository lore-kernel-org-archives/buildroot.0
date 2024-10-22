Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8200FCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F9C406DE;
	Tue, 22 Oct 2024 21:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFxGNm3whWWL; Tue, 22 Oct 2024 21:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96EE7406E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EE7406E2;
	Tue, 22 Oct 2024 21:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1C659F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE55660847
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHTdc7bgZpul for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D670160848
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D670160848
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3D8686316; Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 23:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7bac6fc4ea248b6a52b9c99c7622313c95e38d
X-Git-Newrev: 4a9a4c3cd5f416b44b8ab6c3c7cdfc3cc991a5de
X-Patchwork-Hint: ignore
Message-Id: <20241022211656.C3D8686316@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump to version 5.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a9a4c3cd5f416b44b8ab6c3c7cdfc3cc991a5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 6012e1001b..c403ea2be4 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  xz-5.6.2.tar.bz2
+sha256  a95a49147b2dbb5487517acc0adcd77f9c2032cf00664eeae352405357d14a6c  xz-5.6.3.tar.bz2
 
 # Hash for license files
 sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 3329d302ef..b3f8c30026 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.6.2
+XZ_VERSION = 5.6.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
