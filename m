Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D86CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2844081E15;
	Sat, 16 Sep 2023 12:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2844081E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNcwcjD_1y_6; Sat, 16 Sep 2023 12:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A8381FF4;
	Sat, 16 Sep 2023 12:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A8381FF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8341D1BF863
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67EEA4185C
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67EEA4185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wnPGqDJJNLr for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 677DC417C9
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677DC417C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5491287037; Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:33:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dc1213565e76d9c68986489ada3c06b928089d5
X-Git-Newrev: b5f782ebdd6512b5f76f6e956ae4d3f2710200e0
X-Patchwork-Hint: ignore
Message-Id: <20230916123445.5491287037@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 7.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5f782ebdd6512b5f76f6e956ae4d3f2710200e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index c648a85c04..7f79b94d8d 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  67e2aa27bb98e5af13b45a1b2e67b144  pytest-7.3.2.tar.gz
-sha256  ee990a3cc55ba808b80795a79944756f315c67c12b56abd3ac993a7b8c17030b  pytest-7.3.2.tar.gz
+md5  8620558e8971b11207b2d6b083906cf9  pytest-7.4.2.tar.gz
+sha256  a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069  pytest-7.4.2.tar.gz
 # Locally computer sha256
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 27277163d2..326d951a32 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.3.2
+PYTHON_PYTEST_VERSION = 7.4.2
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/58/2a/07c65fdc40846ecb8a9dcda2c38fcb5a06a3e39d08d4a4960916431951cb
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e5/d0/18209bb95db8ee693a9a04fe056ab0663c6d6b1baf67dd50819dd9cd4bd7
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
