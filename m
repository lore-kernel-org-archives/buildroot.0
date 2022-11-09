Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B7C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C0E403F9;
	Wed,  9 Nov 2022 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C0E403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uVAdbCjjcVF; Wed,  9 Nov 2022 22:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 245404010C;
	Wed,  9 Nov 2022 22:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245404010C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0FB91BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B574010C
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B574010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9vV5DFCXKJ7 for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:05:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD5E340018
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5E340018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC686827E3; Wed,  9 Nov 2022 22:05:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Nov 2022 23:05:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1c32fc61779fa25fdba662012803a14f6c4687d
X-Git-Newrev: a85f5f2a412db894fdf548e10d12e7c56eda9107
X-Patchwork-Hint: ignore
Message-Id: <20221109220534.AC686827E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tpm2-pkcs11: bump
 version to 1.8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a85f5f2a412db894fdf548e10d12e7c56eda9107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 1d5bcc7a54..b027bad72a 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  078a445ed0e9f5009675a162b4b7b88f3520436cfbc791bb2249f37bd1f475bd  tpm2-pkcs11-1.7.0.tar.gz
+sha256  79f28899047defd6b4b72b7268dd56abf27774954022315f818c239af33e05bd  tpm2-pkcs11-1.8.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index adb5a46f56..9d61340775 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.7.0
+TPM2_PKCS11_VERSION = 1.8.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
 TPM2_PKCS11_DEPENDENCIES = host-pkgconf libyaml openssl sqlite tpm2-tss
 
 TPM2_PKCS11_CONF_OPTS += \
-		--disable-hardening
+		--disable-hardening \
+		--disable-ptool-checks
 
 # Fix tpm.c:746:5: error: 'for' loop initial declarations are only allowed in C99 mode
 # Fix implicit declaration of function 'strnlen'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
