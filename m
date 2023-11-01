Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D33BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99757430DE;
	Wed,  1 Nov 2023 11:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99757430DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNgmKHZ304Yr; Wed,  1 Nov 2023 11:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8151F40156;
	Wed,  1 Nov 2023 11:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8151F40156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2B71BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC2D284897
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2D284897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHSDaan0OB2A for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41E6984870
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E6984870
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C533862BD; Wed,  1 Nov 2023 11:16:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:13:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 41f4728e062c214212286e51b223720004a922d3
X-Git-Newrev: 7713240284b215d5e3d87c424c7464cfa950be49
X-Patchwork-Hint: ignore
Message-Id: <20231101111643.2C533862BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wolfssl: bump
 version to 5.6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7713240284b215d5e3d87c424c7464cfa950be49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Changelog: https://github.com/wolfSSL/wolfssl/blob/master/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c03fc8a9fffd3a545abbf9829a81c6fed97c7db6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 08262113a0..3407586edd 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  fd3135b8657d09fb96a8aad16585da850b96ea420ae8ce5ac4d5fdfc614c2683  wolfssl-5.5.3.tar.gz
+sha256  2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a  wolfssl-5.6.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 9f06bb1b4b..9b35a6a84a 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.3
+WOLFSSL_VERSION = 5.6.3
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
