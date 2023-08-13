Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7277CEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 13:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9578175C;
	Sun, 13 Aug 2023 13:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9578175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id em6ZRz_VPkgI; Sun, 13 Aug 2023 13:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B13081499;
	Sun, 13 Aug 2023 13:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B13081499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 793901BF418
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3094181499
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3094181499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CmZaSm1WzLC for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 13:27:30 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96A8B81498
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 13:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A8B81498
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A7E023520C2A; Sun, 13 Aug 2023 15:27:27 +0200 (CEST)
Date: Sun, 13 Aug 2023 15:27:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNjaP1+VWZznRgtI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691933247; bh=ZnSKaBczDIGp4JN8GMGQJir8kQ3XNUfwEr1HKohIrBY=;
 h=Date:From:To:Subject:From;
 b=s5CORSKyZRpJ6PMl9P0LVPvHRK4ejUSaVosPlX12rj+LCxKjjeHvx2OrIODq4BH5B
 MZYGvcgfPwEnhFWL+E5ga1ieME9tGqQiIT30kg3HL/tw9TDsxexVnjZmcjc8oDF+Li
 K8HiezAPnqi8sQEYZuNjfB48phUx2Zd7LLrSTnhKhTesyHll4JaQZuX1rEYWKV+TVT
 k5R0J2WhGEUmepeHRA862KeKgzT5bXWHccFBVhepE9ufvKqMvJR/KXR+P0qRabs5jb
 ze3zUzmFhZjVxRGiCm6iTEJZnClAy8yaOoZdhW2N2x6MyLxdc1l2fFm6s6UmkZ35Hr
 NhiNNJP7Uy+8A==
Subject: [Buildroot] [PATCH/next] package/libxcrypt: bump version to 4.4.36
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the NEWS here:
https://github.com/besser82/libxcrypt/blob/develop/NEWS

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index c13685e463..f021436b71 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0a0c06bcd028fd0f0467f89f6a451112e8ec97c36e0f58e7464449a4c04607ed  libxcrypt-4.4.33.tar.gz
+sha256  b979838d5f1f238869d467484793b72b8bca64c4eae696fdbba0a9e0b6c28453  libxcrypt-4.4.36.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 079445e489..9ad030fbd2 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.33
+LIBXCRYPT_VERSION = 4.4.36
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
