Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C141C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 543E041D31;
	Mon,  8 May 2023 19:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543E041D31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTnn7drgazbd; Mon,  8 May 2023 19:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716A542A98;
	Mon,  8 May 2023 19:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 716A542A98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1DCA1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBB9884573
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB9884573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YfBtlQFXhwqC for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:23:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8F1D84571
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F1D84571
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5F4B8618D; Mon,  8 May 2023 19:23:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:21:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7e7ef2eadfd18c940718ac63a1614709451a398
X-Git-Newrev: 8d7471fcf1b018b8e93d2dfe5ca9e69b96c1f5cb
X-Patchwork-Hint: ignore
Message-Id: <20230508192310.C5F4B8618D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycrate: bump to version
 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d7471fcf1b018b8e93d2dfe5ca9e69b96c1f5cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycrate/Config.in           | 3 ++-
 package/python-pycrate/python-pycrate.hash | 6 +++---
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
index 193a973f7e..bbd6873938 100644
--- a/package/python-pycrate/Config.in
+++ b/package/python-pycrate/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCRATE
 	bool "python-pycrate"
 	help
-	  A software suite to handle various data formats.
+	  A software suite to handle various data and protocol
+	  formats.
 
 	  https://github.com/P1sec/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index e37fd6743a..fd41274369 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
-sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
-# Locally computed
+md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
+sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
+# Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 6779433556..2f947ab807 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.5.5
+PYTHON_PYCRATE_VERSION = 0.6.0
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
