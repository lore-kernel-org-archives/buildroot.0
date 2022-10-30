Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A203ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A6440338;
	Sun, 30 Oct 2022 14:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A6440338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LgmX_2XWUaN; Sun, 30 Oct 2022 14:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C25402C3;
	Sun, 30 Oct 2022 14:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C25402C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394521BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59ABC60592
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59ABC60592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmcUgEnJkLiX for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8789D60ABE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8789D60ABE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7787E87512; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:04:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af3c14b18c72d6681315280d89d428b7b212ab7
X-Git-Newrev: 0511458dc1ef0dd9bc65d674e6a1700f55c883e3
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.7787E87512@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump to
 version 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0511458dc1ef0dd9bc65d674e6a1700f55c883e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-charset-normalizer/python-charset-normalizer.hash | 4 ++--
 package/python-charset-normalizer/python-charset-normalizer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 3d50b2872d..32d8a22e66 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  a70f9fc85b6b8265c982eca6fe51381f  charset-normalizer-2.1.1.tar.gz
-sha256  5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845  charset-normalizer-2.1.1.tar.gz
+md5  169527085be8e6bb7874164c24481eca  charset-normalizer-3.0.0.tar.gz
+sha256  b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770  charset-normalizer-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 72728a25b3..b2c42a74b8 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.1.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.0.0
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/fe/77/6d5d367b7cfee812a88573e80bbe25cea2d015ed2c3490e4464951ff3232
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
