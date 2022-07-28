Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D2FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA4C60AFB;
	Thu, 28 Jul 2022 07:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA4C60AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEm7hf8WofGv; Thu, 28 Jul 2022 07:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C85660671;
	Thu, 28 Jul 2022 07:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C85660671
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF9D41BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C5B40270
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C5B40270
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJFSlt-PwHRp for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:33:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7EEA40052
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7EEA40052
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D848D867A3; Thu, 28 Jul 2022 07:20:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 09:32:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97eede9242edb52aff2d03b628e8954ad8785335
X-Git-Newrev: a5be1da1ff84dc2f523d5192444fe2569779f246
X-Patchwork-Hint: ignore
Message-Id: <20220728072003.D848D867A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 7.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5be1da1ff84dc2f523d5192444fe2569779f246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is just a starting year in licence file now (see [1]), but
licence itself did not change.

Also fixup the spacing in the hash file to match the "new" coding
style.

[1] https://github.com/pytest-dev/pytest/commit/ed24f29e6017183ea22f3136aa180a8e3280cf8a

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest/python-pytest.hash | 6 +++---
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 060dc6189e..c2ead0aa64 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5	8bc467ebd5d571778dc51dd87ff09513  pytest-6.2.5.tar.gz
-sha256	131b36680866a76e6781d13f101efb86cf674ebb9762eb70d3082b6f29889e89  pytest-6.2.5.tar.gz
+md5  4a98001581a18d4084cb5027fdb1467d  pytest-7.1.2.tar.gz
+sha256  a06a0425453864a270bc45e71f783330a7428defb4230fb5e6a731fde06ecd45  pytest-7.1.2.tar.gz
 # Locally computer sha256
-sha256	7898b9b164d4f93fd9a562fd0f592935518b48c4745303964110eb7f7fe64faf  LICENSE
+sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 5aa9ebca6e..85d762ac8b 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 6.2.5
+PYTHON_PYTEST_VERSION = 7.1.2
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/4b/24/7d1f2d2537de114bdf1e6875115113ca80091520948d370c964b88070af2
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/4e/1f/34657c6ac56f3c58df650ba41f8ffb2620281ead8e11bcdc7db63cf72a78
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
