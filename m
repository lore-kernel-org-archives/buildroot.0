Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFAFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97596074C;
	Tue, 25 Jan 2022 18:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0rHq5KtaI64; Tue, 25 Jan 2022 18:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177A860A7E;
	Tue, 25 Jan 2022 18:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC4351BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724F18139A
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLT9zSsxB_zX for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 987F2827FB
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A36F1827E3; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:30:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ad6b3974366844a54c7dadbcffbc62853504675
X-Git-Newrev: 54f5fe5c6d2df4c133c805842e1df30410258010
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.A36F1827E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{,
 3}-pycryptodomex: bump to version 3.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=54f5fe5c6d2df4c133c805842e1df30410258010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to OCB patents expiry:
https://github.com/Legrandin/pycryptodome/commit/5d78d02220022592d79fd7789cc77af6d1859729

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 6 +++---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 7 +++----
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 7 +++----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 544468b37e..9512f185a8 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  3d007103f68f7e902167719655d2b57a  pycryptodomex-3.11.0.tar.gz
-sha256  0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d  pycryptodomex-3.11.0.tar.gz
+md5  dcf0d13044c700410bdce31a5afdf6d0  pycryptodomex-3.13.0.tar.gz
+sha256  63443230247837dd03c5d4028cae5cb2e6793a9ae110e321798bee48a04ff3e9  pycryptodomex-3.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
+sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index f1fda7aea2..92780327a1 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.11.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.13.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-	Public Domain (pycrypto original code), \
-	OCB patent license (OCB mode)
+	Public Domain (pycrypto original code)
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
 $(eval $(python-package))
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index ee03a08ec6..06a46cdf63 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.11.0
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.13.0
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-	Public Domain (pycrypto original code), \
-	OCB patent license (OCB mode)
+	Public Domain (pycrypto original code)
 PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
 HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
