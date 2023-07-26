Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B88C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5160740BD0;
	Wed, 26 Jul 2023 21:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5160740BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8gG9s2xwc4H; Wed, 26 Jul 2023 21:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C23840BC2;
	Wed, 26 Jul 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C23840BC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 796331BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5373640BC2
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5373640BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kF-gS7PQbW4s for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:24:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 837C740A59
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 837C740A59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70AC1835B7; Wed, 26 Jul 2023 21:24:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:22:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e798bfb8ff48acd54540e1347ad09c6ebf4ac29e
X-Git-Newrev: 0cbbb0190a49439d80b03f779d9b253275b0c48b
X-Patchwork-Hint: ignore
Message-Id: <20230726212410.70AC1835B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: bump version to 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cbbb0190a49439d80b03f779d9b253275b0c48b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index b027bad72a..797955a69b 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  79f28899047defd6b4b72b7268dd56abf27774954022315f818c239af33e05bd  tpm2-pkcs11-1.8.0.tar.gz
+sha256  35bf06c30cfa76fc0eba2c5f503cf7dd0d34a66afb2d292fee896b90362f633b  tpm2-pkcs11-1.9.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index 9d61340775..18f04157e3 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.8.0
+TPM2_PKCS11_VERSION = 1.9.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
