Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F3CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB2660908;
	Sat, 21 Sep 2024 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdRlWSdpqBe1; Sat, 21 Sep 2024 21:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F5CE60A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F5CE60A6A;
	Sat, 21 Sep 2024 21:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 134271BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E983403C8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3Au6vY-NnHY for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C08B404D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C08B404D7
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 486F88417C; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 312be2346957101fd1a4fea32fc415da505cbce0
X-Git-Newrev: 38999488d422b84b5ba084bbb73dd84c4dacc78c
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.486F88417C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 8.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=38999488d422b84b5ba084bbb73dd84c4dacc78c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 1d5a874238..15ac04a6ea 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  6a85eccffeb0fa15c104f408d82ce7fa  pytest-8.1.1.tar.gz
-sha256  ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044  pytest-8.1.1.tar.gz
+md5  71466867181a5a7aefdb298b7146bcad  pytest-8.3.3.tar.gz
+sha256  70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181  pytest-8.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 90dc91b654..256b6954f0 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 8.1.1
+PYTHON_PYTEST_VERSION = 8.3.3
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/30/b7/7d44bbc04c531dcc753056920e0988032e5871ac674b5a84cb979de6e7af
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/8b/6c/62bbd536103af674e227c41a8f3dcd022d591f6eed5facb5a0f31ee33bbc
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
