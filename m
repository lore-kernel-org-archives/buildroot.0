Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F53CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A8281489;
	Sun, 22 Sep 2024 10:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4j8dC9KQfOD; Sun, 22 Sep 2024 10:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E49B881586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E49B881586;
	Sun, 22 Sep 2024 10:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773061BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F076061F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 902Vzi2uJ31C for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95ABA6062D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95ABA6062D
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 842D281446; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a91a1b484d13db77e33e421b97d1d884cb761d9f
X-Git-Newrev: f01897aa6ceca00831c9b2c14f3ae90faaefce68
X-Patchwork-Hint: ignore
Message-Id: <20240922103439.842D281446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 75.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f01897aa6ceca00831c9b2c14f3ae90faaefce68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase add executable patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-setuptools/0001-add-executable.patch | 16 ++++++++--------
 package/python-setuptools/python-setuptools.hash    |  4 ++--
 package/python-setuptools/python-setuptools.mk      |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index da1bc68b39..cd3cb66a5b 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From a35dffe950d7bb0f7988d78ec4a963c5ce67e3c8 Mon Sep 17 00:00:00 2001
+From aa232855cf717835a5d16954f1fd8ead315a5fa6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,18 +22,18 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index c49fcda93..851950522 100644
+index e2ec1abdd..e78ace3d4 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -18,6 +18,7 @@ class install(orig.install):
-     """Use easy_install to install the package, w/dependencies"""
+@@ -26,6 +26,7 @@ class install(orig.install):
+     distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
  
      user_options = orig.install.user_options + [
 +        ('executable=', 'e', "specify final destination interpreter path"),
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -50,6 +51,7 @@ class install(orig.install):
+@@ -60,6 +61,7 @@ class install(orig.install):
          )
  
          super().initialize_options()
@@ -42,10 +42,10 @@ index c49fcda93..851950522 100644
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index f44281b49..9e91cad87 100644
+index 7b90611d1..216cadf80 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -14,6 +14,13 @@ class install_scripts(orig.install_scripts):
+@@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -59,7 +59,7 @@ index f44281b49..9e91cad87 100644
  
      def run(self) -> None:
          self.run_command("egg_info")
-@@ -40,6 +47,8 @@ class install_scripts(orig.install_scripts):
+@@ -45,6 +52,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 29237427a0..6ca17b8c73 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  f404be507829989fcff7a8b63d92f357  setuptools-71.0.3.tar.gz
-sha256  3d8531791a27056f4a38cd3e54084d8b1c4228ff9cf3f2d7dd075ec99f9fd70d  setuptools-71.0.3.tar.gz
+md5  8e8aed1625afae37b59272ff981d6e1c  setuptools-75.1.0.tar.gz
+sha256  d59a21b17a275fb872a9c3dae73963160ae079f1049ed956880cd7c09b120538  setuptools-75.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cf7016ecff..72d1c96543 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 71.0.3
+PYTHON_SETUPTOOLS_VERSION = 75.1.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d1/8e/1d0b941ce1151009c6d98a0a590a608f346d4d272ce95ca09ee2bbb592cd
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/27/b8/f21073fde99492b33ca357876430822e4800cdf522011f18041351dfa74b
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
