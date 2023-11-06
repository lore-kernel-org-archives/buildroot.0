Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5056C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3A441DD0;
	Mon,  6 Nov 2023 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3A441DD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCoGWTFKsV_N; Mon,  6 Nov 2023 21:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CBCC41D91;
	Mon,  6 Nov 2023 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CBCC41D91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 487CB1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20E6E820B1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E6E820B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACqs8Nnmlzau for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5B582085
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5B582085
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBFD086A82; Mon,  6 Nov 2023 21:27:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:24:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b11db85debb875ea97414d0a92d0f3ea5afd136
X-Git-Newrev: 718794637b948d4fcff9a3c6b7e6785e01697ee0
X-Patchwork-Hint: ignore
Message-Id: <20231106212702.EBFD086A82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 68.2.2
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
Content-Type: multipart/mixed; boundary="===============5687471711290353322=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5687471711290353322==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=718794637b948d4fcff9a3c6b7e6785e01697ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh add executable patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-setuptools/0001-add-executable.patch    | 27 +++++++++++-----------
 package/python-setuptools/python-setuptools.hash   |  4 ++--
 package/python-setuptools/python-setuptools.mk     |  4 ++--
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index b688745ce4..d93298e118 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
+From 975379e84ae3229fac94cd0499fd4ba7baa574ba Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -15,13 +15,14 @@ force the shebang line in installed python scripts.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  setuptools/command/install.py         | 2 ++
  setuptools/command/install_scripts.py | 9 +++++++++
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index 72b9a3e..6781d2b 100644
+index 606cce9d8..f158e1b51 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
 @@ -16,6 +16,7 @@ class install(orig.install):
@@ -30,9 +31,9 @@ index 72b9a3e..6781d2b 100644
      user_options = orig.install.user_options + [
 +        ('executable=', 'e', "specify final destination interpreter path"),
          ('old-and-unmanageable', None, "Try not to use this!"),
-         ('single-version-externally-managed', None,
-          "used by system package builders to create 'flat' eggs"),
-@@ -38,6 +39,7 @@ class install(orig.install):
+         (
+             'single-version-externally-managed',
+@@ -48,6 +49,7 @@ class install(orig.install):
          )
  
          orig.install.initialize_options(self)
@@ -41,10 +42,10 @@ index 72b9a3e..6781d2b 100644
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index 9cd8eb0..7786150 100644
+index 72b2e45cb..146a0bb58 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -13,6 +13,13 @@ class install_scripts(orig.install_scripts):
+@@ -12,6 +12,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -57,16 +58,16 @@ index 9cd8eb0..7786150 100644
 +        )
  
      def run(self):
-         import setuptools.command.easy_install as ei
-@@ -33,6 +40,8 @@ class install_scripts(orig.install_scripts):
+         self.run_command("egg_info")
+@@ -38,6 +45,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
 +        if self.executable is not None:
 +            exec_param = self.executable
-         try:
-             bw_cmd = self.get_finalized_command("bdist_wininst")
-             is_wininst = getattr(bw_cmd, '_is_running', False)
+         writer = ei.ScriptWriter
+         if exec_param == sys.executable:
+             # In case the path to the Python executable contains a space, wrap
 -- 
-2.30.2
+2.34.1
 
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 45413af27e..6e1df42e3f 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  c5e4ff6557d99204464aa300c0bad7d4  setuptools-68.0.0.tar.gz
-sha256  baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235  setuptools-68.0.0.tar.gz
+md5  d967ca2ba7f46db887daee2d5c9bd6a2  setuptools-68.2.2.tar.gz
+sha256  4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87  setuptools-68.2.2.tar.gz
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 39ead10f55..f26f427ccc 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 68.0.0
+PYTHON_SETUPTOOLS_VERSION = 68.2.2
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/dc/98/5f896af066c128669229ff1aa81553ac14cfb3e5e74b6b44594132b8540e
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/cc/93f7213b2ab5ed383f98ce8020e632ef256b406b8569606c3f160ed8e1c9
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python

--===============5687471711290353322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5687471711290353322==--
