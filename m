Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA504C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:37:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A510F60FF2
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A510F60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784414037A;
	Tue, 20 Jul 2021 20:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd7wtRIG2YvS; Tue, 20 Jul 2021 20:37:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD34F402BC;
	Tue, 20 Jul 2021 20:36:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 459BB1BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3501F401BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cP0Cp2KIcOup for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:36:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55D3B4037A
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 29EA37F898; Tue, 20 Jul 2021 20:02:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:36:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee2b62859c11a109b2db97c6239b296267ec6910
X-Git-Newrev: 5bbe5979a2e2e10bc5dfb31a6486eafdf9b15a75
X-Patchwork-Hint: ignore
Message-ID: <20210720200250.29EA37F898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asn1crypto: bump to version
 1.4.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720203631.t5s4XkihT8uANDeRI5rMbDFnRVUKr2f9ZZ1lRjOH5ko@z>

commit: https://git.buildroot.net/buildroot/commit/?id=5bbe5979a2e2e10bc5dfb31a6486eafdf9b15a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/wbond/asn1crypto/blob/1.4.0/changelog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 6 +++---
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index b00474bdcd..fb2da94ed5 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	daad112940181917e3ff169b47b9bd9a  asn1crypto-1.3.0.tar.gz
-sha256	5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d  asn1crypto-1.3.0.tar.gz
+md5  00bf5b72d37778e62cc73b1d8909ae27  asn1crypto-1.4.0.tar.gz
+sha256  f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c  asn1crypto-1.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
+sha256  a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 2d8d384cca..af4e43b3d0 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.3.0
+PYTHON_ASN1CRYPTO_VERSION = 1.4.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/9f/3d/8beae739ed8c1c8f00ceac0ab6b0e97299b42da869e24cf82851b27a9123
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/6b/b4/42f0e52ac2184a8abb31f0a6f98111ceee1aac0b473cee063882436e0e09
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
