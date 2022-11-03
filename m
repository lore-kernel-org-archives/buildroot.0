Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FB1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A5E40BDA;
	Thu,  3 Nov 2022 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A5E40BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-M3bmqCMWuU; Thu,  3 Nov 2022 21:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4586240BCE;
	Thu,  3 Nov 2022 21:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4586240BCE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0811BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5310F40BF8
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310F40BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUetjMA3hFhE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50A2540BC6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A2540BC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D15D87BCD; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6bed05b2f1b660383b7c6835d59b45eac01bf982
X-Git-Newrev: 1cc98a4f39a2d8ba8d7cfd8fca32776e54f32b8c
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.4D15D87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-libusb1: bump
 to version 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cc98a4f39a2d8ba8d7cfd8fca32776e54f32b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-libusb1/python-libusb1.hash | 7 ++++---
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index 7d2302e088..86dea08c89 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
-md5  b087646fb0c8c4cf7e8123af72f885b9  libusb1-2.0.1.tar.gz
-sha256  d3ba82ecf7ab6a48d21dac6697e26504670cc3522b8e5941bd28fb56cf3f6c46  libusb1-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/libusb1/json
+md5  ffbb02bf9aa49f973a6a58112aed7b06  libusb1-3.0.0.tar.gz
+sha256  5792a9defee40f15d330a40d9b1800545c32e47ba7fc66b6f28f133c9fcc8538  libusb1-3.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 40a64141af..48a0b1dea3 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 2.0.1
+PYTHON_LIBUSB1_VERSION = 3.0.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a9/97/e8afa2af12b6de608ec86c8c4ad57f1248d98946d1b5e1aa0bff926755e9
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/f4/83/59bf75e74e0c4859ea63eae0c7da660c1dcb78b31667d4a5f735d52f5974
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
