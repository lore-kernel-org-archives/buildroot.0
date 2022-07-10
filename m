Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF00C43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 08:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D672B4060D;
	Sun, 10 Jul 2022 08:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D672B4060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5CWLOrqfLtl; Sun, 10 Jul 2022 08:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCDAB405DC;
	Sun, 10 Jul 2022 08:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCDAB405DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55D821BF372
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 08:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF41405DC
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 08:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF41405DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFyhmhIkcj4P for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 08:49:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E595840327
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E595840327
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 08:49:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (24)
Received: from bartekk-pc.lan (unknown [78.8.136.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 2A42E1BC26A;
 Sun, 10 Jul 2022 10:49:30 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 10:49:28 +0200
Message-Id: <20220710084928.537249-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-esptool: bump version to 4.1
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
Cc: Bartosz Bilas <bartosz.bilas@hotmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 354955b2f3..4f19fbde41 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  4e36d267401de7ef80ed84c141d8d41d  esptool-4.0.tar.gz
-sha256  bf6ed90864a02da70fe20132ab589e892ec0af7437df9e0bc4844afd2fc2dac0  esptool-4.0.tar.gz
+md5  60bf3a49a794ff5627552f642f28ea3d  esptool-4.1.tar.gz
+sha256  51a41655187780cb802a5827fab68a3db0d6206330560459c55fcf0e222f277f  esptool-4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index de7669d057..51bc563c5c 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.0
+PYTHON_ESPTOOL_VERSION = 4.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/2d/91/76dac7a2c87172ee01e3e6e9ee17afb0b732065d49b476fef65c1ff8a386
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/bb/d5/9d000803520b68fd9f6447cd7c15352a79984196f57f0519839b0f80fb8f
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
