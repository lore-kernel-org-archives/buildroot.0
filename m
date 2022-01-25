Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A87AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B639960706;
	Tue, 25 Jan 2022 18:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iiR35rL4Y37; Tue, 25 Jan 2022 18:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C2E6074C;
	Tue, 25 Jan 2022 18:35:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2091F1BF990
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AEC0403CA
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXFo6ZnqkQnV for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D47040474
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 70CDF827E1; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:23:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 051a6f8afbb0b4e5a56e011a12fa3427e89e4c10
X-Git-Newrev: 9c2a2aa1faeff4d3396b7ba402b54e1d874b679f
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.70CDF827E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python{,
 3}-pycparser: bump to version 2.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c2a2aa1faeff4d3396b7ba402b54e1d874b679f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/eliben/pycparser/commit/78beeb7d6f0a760f90a8592d9533042363a82810

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 package/python3-pycparser/python3-pycparser.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 0426444399..34401a319a 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  b8f88de737db8c346ee8d31c07c7a25a  pycparser-2.20.tar.gz
-sha256  2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0  pycparser-2.20.tar.gz
+md5  48f7d743bf018f7bb2ffc5fb976d1492  pycparser-2.21.tar.gz
+sha256  e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206  pycparser-2.21.tar.gz
 # Locally computed sha256 checksums
-sha256  3c76629880aec2f8578ed914701a4ff9e5da8b60acb8b7ec675abf83c90c5168  LICENSE
+sha256  3e7df25b8dfb658c9a91501930d4d943b05087a8347c7e2b4325616af535047b  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 5f44a562af..20c3f641a9 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycparser/python3-pycparser.mk
-PYTHON_PYCPARSER_VERSION = 2.20
+PYTHON_PYCPARSER_VERSION = 2.21
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
index 68769ceb46..4075f4a38f 100644
--- a/package/python3-pycparser/python3-pycparser.mk
+++ b/package/python3-pycparser/python3-pycparser.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycparser/python-pycparser.mk
-PYTHON3_PYCPARSER_VERSION = 2.20
+PYTHON3_PYCPARSER_VERSION = 2.21
 PYTHON3_PYCPARSER_SOURCE = pycparser-$(PYTHON3_PYCPARSER_VERSION).tar.gz
-PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
 PYTHON3_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON3_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON3_PYCPARSER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
