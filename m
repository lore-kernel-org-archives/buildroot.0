Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ACAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE8060B55;
	Wed, 29 Dec 2021 23:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoC8aTSIVhEQ; Wed, 29 Dec 2021 23:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0A360B50;
	Wed, 29 Dec 2021 23:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABBE11BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A85648142C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_074e8Z9qGU for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:07:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D9981424
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:07:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 615A182D32; Wed, 29 Dec 2021 23:01:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 00:06:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b012574b2274d7804dbd6e86758e5225c1febc8
X-Git-Newrev: b59c4c1658c5d864ea0e77f62141980a3eab6a87
X-Patchwork-Hint: ignore
Message-Id: <20211229230132.615A182D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: bump to version
 1.21.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b59c4c1658c5d864ea0e77f62141980a3eab6a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file information as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/python-numpy.hash | 11 +++++------
 package/python-numpy/python-numpy.mk   | 16 +++++++++-------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index ff9d02643c..7c111f7bc8 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,9 +1,8 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.18.1
-sha256  da204ce460aa4247e595b7c7189d2fb2ed5f796bc03197055de01dac61d0125e	numpy-1.18.2.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.21.2
+sha256  76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05  numpy-1.21.2.tar.gz
 # License files, locally calculated
-sha256  ad81d0c21843ba6ce6fe5fa3eaacb61120be70cd798c52f63df3f4c12a843f0c	LICENSE.txt
-sha256  d3045980e80a6b39f98586c24bc7f39a7625b4b9f08ce72e367d12814743d047	numpy/core/src/multiarray/dragon4.c
-sha256  426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt
-sha256	154a8706fa0fdeff1073bf6239c4ecf51f562ab107066eef839dade1a45c824c	doc/scipy-sphinx-theme/LICENSE.txt
+sha256  bc1b0af15cdc9415ea26c5f1df352c226ac86425ec0fb9ab38d111018bf1c6f2  LICENSE.txt
+sha256  2be6947e0432ecf7950ee8fe38681316749dd06d1de17c9ec4de6d2f55adb3a1  numpy/core/src/multiarray/dragon4.c
+sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55	numpy/linalg/lapack_lite/LICENSE.txt
 sha256  badf51c7e3e7de9c7630bd069780f5c197b846ef7660b342a1e58d5553592d8e	tools/npy_tempita/license.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 72c6e0c981..ae72b87db0 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.18.2
+PYTHON_NUMPY_VERSION = 1.21.2
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
-PYTHON_NUMPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
-PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
-			doc/scipy-sphinx-theme/LICENSE.txt \
-			numpy/linalg/lapack_lite/LICENSE.txt \
-			tools/npy_tempita/license.txt \
-			numpy/core/src/multiarray/dragon4.c
+PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
+PYTHON_NUMPY_LICENSE_FILES = \
+	LICENSE.txt \
+	numpy/core/src/multiarray/dragon4.c \
+	numpy/core/include/numpy/libdivide/LICENSE.txt \
+	numpy/linalg/lapack_lite/LICENSE.txt \
+	tools/npy_tempita/license.txt
+
 PYTHON_NUMPY_SETUP_TYPE = setuptools
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
