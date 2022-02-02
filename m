Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5318C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C2760EC3;
	Wed,  2 Feb 2022 10:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUQE2uIW38O9; Wed,  2 Feb 2022 10:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6FE60B20;
	Wed,  2 Feb 2022 10:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F44C1BF9AD
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC7B960EC3
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id so2xlWb_O_tt for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00BA60B31
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF473829F9; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:20:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7995738abf772109d3df2a55eb9ab114d43f1c99
X-Git-Newrev: 43c8afef8ddd5ce590076c0932c78c4953279c68
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.CF473829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-setuptools: bump to
 version 60.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=43c8afef8ddd5ce590076c0932c78c4953279c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/59.8.0/python-setuptools.hash               | 4 ----
 .../python-setuptools/{59.8.0 => 60.6.0}/0001-add-executable.patch    | 0
 package/python-setuptools/60.6.0/python-setuptools.hash               | 4 ++++
 package/python-setuptools/python-setuptools.mk                        | 4 ++--
 package/python3-setuptools/0001-add-executable.patch                  | 2 +-
 package/python3-setuptools/python3-setuptools.hash                    | 2 +-
 package/python3-setuptools/python3-setuptools.mk                      | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-setuptools/59.8.0/python-setuptools.hash b/package/python-setuptools/59.8.0/python-setuptools.hash
deleted file mode 100644
index 285919639d..0000000000
--- a/package/python-setuptools/59.8.0/python-setuptools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  675f2089d970bf0bbfc3f49c80e4c7c3  setuptools-59.8.0.tar.gz
-sha256  09980778aa734c3037a47997f28d6db5ab18bdf2af0e49f719bfc53967fd2e82  setuptools-59.8.0.tar.gz
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/59.8.0/0001-add-executable.patch b/package/python-setuptools/60.6.0/0001-add-executable.patch
similarity index 100%
rename from package/python-setuptools/59.8.0/0001-add-executable.patch
rename to package/python-setuptools/60.6.0/0001-add-executable.patch
diff --git a/package/python-setuptools/60.6.0/python-setuptools.hash b/package/python-setuptools/60.6.0/python-setuptools.hash
new file mode 100644
index 0000000000..734cb4d580
--- /dev/null
+++ b/package/python-setuptools/60.6.0/python-setuptools.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/setuptools/json
+md5  392e91d7e244998c586c88da2cf881d3  setuptools-60.6.0.tar.gz
+sha256  eb83b1012ae6bf436901c2a2cee35d45b7260f31fd4b65fd1e50a9f99c11d7f8  setuptools-60.6.0.tar.gz
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d83336b909..15912d96f5 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -9,9 +9,9 @@
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 # Please keep in sync with
 # package/python3-setuptools/python3-setuptools.mk
-PYTHON_SETUPTOOLS_VERSION = 59.8.0
+PYTHON_SETUPTOOLS_VERSION = 60.6.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
 else # Python
 PYTHON_SETUPTOOLS_VERSION = 44.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
diff --git a/package/python3-setuptools/0001-add-executable.patch b/package/python3-setuptools/0001-add-executable.patch
index 6fc7595a8d..9d608239bc 120000
--- a/package/python3-setuptools/0001-add-executable.patch
+++ b/package/python3-setuptools/0001-add-executable.patch
@@ -1 +1 @@
-../python-setuptools/59.8.0/0001-add-executable.patch
\ No newline at end of file
+../python-setuptools/60.6.0/0001-add-executable.patch
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.hash b/package/python3-setuptools/python3-setuptools.hash
index 91d8bc0887..9fb96015aa 120000
--- a/package/python3-setuptools/python3-setuptools.hash
+++ b/package/python3-setuptools/python3-setuptools.hash
@@ -1 +1 @@
-../python-setuptools/59.8.0/python-setuptools.hash
\ No newline at end of file
+../python-setuptools/60.6.0/python-setuptools.hash
\ No newline at end of file
diff --git a/package/python3-setuptools/python3-setuptools.mk b/package/python3-setuptools/python3-setuptools.mk
index f4dae2d15d..55a01dba01 100644
--- a/package/python3-setuptools/python3-setuptools.mk
+++ b/package/python3-setuptools/python3-setuptools.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-setuptools/python-setuptools.mk
-PYTHON3_SETUPTOOLS_VERSION = 59.8.0
+PYTHON3_SETUPTOOLS_VERSION = 60.6.0
 PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).tar.gz
-PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/75/2bc7bef4d668f9caa9c6ed3f3187989922765403198243040d08d2a52725
+PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/8f/89/9fec81ec84737c925a1ee992af2c6c7153aec4051c26afeadd6b822354d2
 PYTHON3_SETUPTOOLS_LICENSE = MIT
 PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON3_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
