Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C90C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD4A60FB5;
	Wed,  2 Feb 2022 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uKlm97KAswS; Wed,  2 Feb 2022 10:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C8960FAD;
	Wed,  2 Feb 2022 10:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A061BF9AD
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46BC483B07
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-rwAxAfKfT5 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A616B83312
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3F02822ED; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:18:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 414fa848445eaede01264ad9d8374585b18a95c0
X-Git-Newrev: 3fae4cddea023b008b59f99986f8aaef9d1cb562
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.A3F02822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{3}-cython: bump to version
 0.29.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fae4cddea023b008b59f99986f8aaef9d1cb562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 package/python3-cython/python3-cython.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index b07f171c25..9c5f1225cf 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  971c9708dd5269180868fc0af986084c  Cython-0.29.26.tar.gz
-sha256  af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312  Cython-0.29.26.tar.gz
+md5  2b2ba86abcf823985935d37f5e43b19a  Cython-0.29.27.tar.gz
+sha256  c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2  Cython-0.29.27.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cf41086dea..89708cb9a8 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cython/python3-cython.mk
-PYTHON_CYTHON_VERSION = 0.29.26
+PYTHON_CYTHON_VERSION = 0.29.27
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
index da159cedc8..56d88b5bf7 100644
--- a/package/python3-cython/python3-cython.mk
+++ b/package/python3-cython/python3-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.26
+PYTHON3_CYTHON_VERSION = 0.29.27
 PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/eb/46/80dd9e5ad67ebc766ff3229901bde4a7bc82907efe93cd7007c4df458dd5
 PYTHON3_CYTHON_SETUP_TYPE = setuptools
 PYTHON3_CYTHON_LICENSE = Apache-2.0
 PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
