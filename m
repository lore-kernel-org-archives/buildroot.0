Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05D8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5CA82CD4;
	Wed, 20 Apr 2022 20:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBreJizY7iXv; Wed, 20 Apr 2022 20:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6836382D75;
	Wed, 20 Apr 2022 20:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 690311BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A1C782C61
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTURhUG2MlN6 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1DBB82CD4
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AD93383F55; Wed, 20 Apr 2022 20:32:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:37:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d9efb434555b7c7ed4fb1ec0ec0b4b23a3cf02
X-Git-Newrev: daf331b3afac908e0d7949e55659182810dbbf1c
X-Patchwork-Hint: ignore
Message-Id: <20220420203211.AD93383F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asn1crypto: bump to version
 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=daf331b3afac908e0d7949e55659182810dbbf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/wbond/asn1crypto/commit/557a90012370d31eefccd92599dc1d9fa2fe99f2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-asn1crypto/python-asn1crypto.hash | 6 +++---
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index fb2da94ed5..4c9fda4618 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5  00bf5b72d37778e62cc73b1d8909ae27  asn1crypto-1.4.0.tar.gz
-sha256  f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c  asn1crypto-1.4.0.tar.gz
+md5  f7a5271af9b81246fbdf57d703afce2f  asn1crypto-1.5.1.tar.gz
+sha256  13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c  asn1crypto-1.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
+sha256  29c3425e5da53ab842273e5f2f2f068ce2e35df4260f7fa156aa1ac6bed02433  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index af4e43b3d0..480b70d17a 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.4.0
+PYTHON_ASN1CRYPTO_VERSION = 1.5.1
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/6b/b4/42f0e52ac2184a8abb31f0a6f98111ceee1aac0b473cee063882436e0e09
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
