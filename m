Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6D9C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8903160F1A;
	Mon,  5 Feb 2024 13:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8903160F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogbIsDgmytrj; Mon,  5 Feb 2024 13:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6D660E6B;
	Mon,  5 Feb 2024 13:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6D660E6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E95951BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEEB441862
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEEB441862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-n6Oj1iiZoA for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F21E41706
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F21E41706
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0FE486C7A; Mon,  5 Feb 2024 13:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:28:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 362e5cee6237b2f3a341edad11e435773a0d491a
X-Git-Newrev: 06cdc02ef2d0124972448c4b0ffda3da2530bb23
X-Patchwork-Hint: ignore
Message-Id: <20240205132914.F0FE486C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-fancy-pypi-readme:
 bump to version 24.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06cdc02ef2d0124972448c4b0ffda3da2530bb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../python-hatch-fancy-pypi-readme.hash                             | 6 +++---
 .../python-hatch-fancy-pypi-readme.mk                               | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
index d9fdb88e1f..e3a6363eb7 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
-md5  8755cce1a4a4d5e5d84992089801acbf  hatch_fancy_pypi_readme-23.1.0.tar.gz
-sha256  b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d  hatch_fancy_pypi_readme-23.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
+md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
+sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 6195a30436..2a26892388 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_FANCY_PYPI_README_VERSION = 23.1.0
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
 PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
-PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/85/a6/58d585eba4321bf2e7a4d1ed2af141c99d88c1afa4b751926be160f09325
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
