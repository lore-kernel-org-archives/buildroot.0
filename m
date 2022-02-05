Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7076DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 11:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE9F4055D;
	Sat,  5 Feb 2022 11:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Eq3hgzPVV2u; Sat,  5 Feb 2022 11:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B747A4051B;
	Sat,  5 Feb 2022 11:45:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 213E31BF4E4
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE65D404FB
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4BYLWrNCVfQ for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 11:44:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C37B74051B
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 11:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BFD89819CD; Sat,  5 Feb 2022 11:37:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 12:44:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9fc598a4d0fd8f9172ee589d628474e7ba1c3ea
X-Git-Newrev: 89cf28a8f30cfeb05bfce326019bec8344a7a115
X-Patchwork-Hint: ignore
Message-Id: <20220205113732.BFD89819CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-setuptools: bump to
 version 60.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=89cf28a8f30cfeb05bfce326019bec8344a7a115
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/60.6.0/python-setuptools.hash               | 4 ----
 .../python-setuptools/{60.6.0 => 60.7.0}/0001-add-executable.patch    | 0
 package/python-setuptools/60.7.0/python-setuptools.hash               | 4 ++++
 package/python-setuptools/python-setuptools.mk                        | 4 ++--
 package/python3-setuptools/0001-add-executable.patch                  | 2 +-
 package/python3-setuptools/python3-setuptools.hash                    | 2 +-
 package/python3-setuptools/python3-setuptools.mk                      | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-setuptools/60.6.0/python-setuptools.hash b/package/python-setuptools/60.6.0/python-setuptools.hash
deleted file mode 100644
index 734cb4d580..0000000000
--- a/package/python-setuptools/60.6.0/python-setuptools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  392e91d7e244998c586c88da2cf881d3  setuptools-60.6.0.tar.gz
-sha256  eb83b1012ae6bf436901c2a2cee35d45b7260f31fd4b65fd1e50a9f99c11d7f8  setuptools-60.6.0.tar.gz
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/60.6.0/0001-add-executable.patch b/package/python-setuptools/60.7.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/60.6.0/0001-add-executable.patch
rename to package/python-setuptools/60.7.0/0001-add-executable.patch
diff --git a/package/python-setuptools/60.7.0/python-setuptools.hash b/package/python-setuptools/60.7.0/python-setuptools.hash
new file mode 100644
index 0000000000..8df7155d4c
--- /dev/null
+++ b/package/python-setuptools/60.7.0/python-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  082637e8fbc2e1fd9c637665d8fcccd8  setuptools-60.7.0.tar.gz
+sha256  b83cf328a4f6a987c95610e76b29a30778db05174eef71f771776c48f8f25d1b  setuptools-60.7.0.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 15912d96f5..8bca852fe2 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -9,9 +9,9 @@
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 60.6.0
+PYTHON_SETUPTOOLS_VERSION = 60.7.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
 else # Python
 PYTHON_SETUPTOOLS_VERSION = 44.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
index 9d608239bc..46b5935d33 120000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -1 +1 @@
-../python-setuptools/60.6.0/0001-add-executable.patch
\ No newline at end of file
+../python-setuptools/60.7.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
index 9fb96015aa..2c9d3614d5 120000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -1 +1 @@
-../python-setuptools/60.6.0/python-setuptools.hash
\ No newline at end of file
+../python-setuptools/60.7.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index 55a01dba01..d5aaa01918 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 60.6.0
+PYTHON3_SETUPTOOLS_VERSION = 60.7.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/29/dd/48d662bb93e5e51e72265ef612f869947d4ae4126328d7156824cd50d440
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
