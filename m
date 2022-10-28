Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA86FA3742
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6A8410C9;
	Fri, 28 Oct 2022 06:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6A8410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dok69JHBGW-m; Fri, 28 Oct 2022 06:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1859140448;
	Fri, 28 Oct 2022 06:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1859140448
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13FF71BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1AD0400D0
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1AD0400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ww4w7nqF2_N for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:51:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFD8240133
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFD8240133
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE089873BB; Fri, 28 Oct 2022 06:51:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:49:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 671af464266326fd3d2dcbfb722bf57a96b692b6
X-Git-Newrev: 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55
X-Patchwork-Hint: ignore
Message-Id: <20221028065137.DE089873BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: bump to version
 1.23.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=32d8e23b977a5bba1f23e3821709c6aa9ff3bc55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/numpy/numpy/commit/4fc42f99b7f96b1000c777a478f58e2744bb3656

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/python-numpy.hash | 8 ++++----
 package/python-numpy/python-numpy.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index c0dcc5d27f..2a2dec44da 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,8 +1,8 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.21.2
-sha256  76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05  numpy-1.21.2.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.4
+sha256  ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c  numpy-1.23.4.tar.gz
 # License files, locally calculated
-sha256  bc1b0af15cdc9415ea26c5f1df352c226ac86425ec0fb9ab38d111018bf1c6f2  LICENSE.txt
-sha256  2be6947e0432ecf7950ee8fe38681316749dd06d1de17c9ec4de6d2f55adb3a1  numpy/core/src/multiarray/dragon4.c
+sha256  0f88787955e7131224f53a8c3f3e859dc502408e3a539a4dcf61fb7888b5b984  LICENSE.txt
+sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
 sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e  tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 417fe81f57..4f4848c4ba 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.21.2
+PYTHON_NUMPY_VERSION = 1.23.4
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
