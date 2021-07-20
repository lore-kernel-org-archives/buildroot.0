Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A15060F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A15060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199CB405FC;
	Tue,  3 Aug 2021 23:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyoAABZWBqs4; Tue,  3 Aug 2021 23:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11B540655;
	Tue,  3 Aug 2021 23:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A83041BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C823040F81
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXxi-5TlJC9q for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F5640001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 43F61878D7; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:43:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8bc365862de301926e0bfc404ff70f856a7b51b1
X-Git-Newrev: eb8a32a21c5a2d7b15387393dd1129d27558c30e
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.43F61878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aioblescan:
 bump to version 0.2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb8a32a21c5a2d7b15387393dd1129d27558c30e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove 0001-Move-README-to-reStructured-text.patch
since it has been merged upstream.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Move-README-to-reStructured-text.patch    | 35 ----------------------
 package/python-aioblescan/python-aioblescan.hash   |  4 +--
 package/python-aioblescan/python-aioblescan.mk     |  4 +--
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch b/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
deleted file mode 100644
index 3db03bd835..0000000000
--- a/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 62260e0a42dd6c1c10660f68a531c49bd6cade2e Mon Sep 17 00:00:00 2001
-From: Francois Wautier <francois@wautier.eu>
-Date: Thu, 25 Feb 2021 20:07:08 +0700
-Subject: [PATCH] Move README to reStructured text
-
-Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 582a994..315b3bb 100644
---- a/setup.py
-+++ b/setup.py
-@@ -4,7 +4,7 @@ import setuptools
- 
- version = "0.2.7"
- 
--with open("README.md", "r") as fh:
-+with open("README.rst", "r") as fh:
-     long_description = fh.read()
- 
- setuptools.setup(
-@@ -16,7 +16,7 @@ setuptools.setup(
-     author_email="francois@wautier.eu",
-     description="Scanning Bluetooth for advertised info with asyncio.",
-     long_description=long_description,
--    long_description_content_type="text/markdown",
-+    long_description_content_type="text/x-rst",
-     url="http://github.com/frawau/aioblescan",
-     keywords=["bluetooth", "advertising", "hci", "ble"],
-     license="MIT",
--- 
-2.27.0
-
diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 99a715dcd0..2592aace33 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  fbcbf92260269d401a197636412f0c99  aioblescan-0.2.7.tar.gz
-sha256  2987f575c5129a21e42ad59e439feb3c96e0ad7210ef73af8eba1344106e5f5f  aioblescan-0.2.7.tar.gz
+md5  f59934c040a817192fcd3e713633cf20  aioblescan-0.2.8.tar.gz
+sha256  2b048f5fe6e85b18fe306bdb63307705f3d1139563d3187d751b8657065a5bd9  aioblescan-0.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 2ace10503e..8a9db927ac 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.7
+PYTHON_AIOBLESCAN_VERSION = 0.2.8
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/78/2c/c09d8f83ed6c2ca6c4f803f2e5c349698eb78b82c8d5e9302a8eed1a7480
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/d2/10/b8b496903f33935c99f3602200d44ccc0b0a57b87e5fa65b89466c1b1f31
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
