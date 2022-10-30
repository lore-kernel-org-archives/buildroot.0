Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D216ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B81B60ADC;
	Sun, 30 Oct 2022 14:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B81B60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkRFYuFS_CEp; Sun, 30 Oct 2022 14:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 712E960ABD;
	Sun, 30 Oct 2022 14:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712E960ABD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E49C1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73ACE81257
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73ACE81257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXl4pLAErtnp for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F84B80F2C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F84B80F2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D79287510; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:03:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff89dab6a0947a45a0be11cc90f4902a5e3d037d
X-Git-Newrev: f3f71a4f6cede1b3461deccdf99c06017df56afa
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.2D79287510@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 version 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3f71a4f6cede1b3461deccdf99c06017df56afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date/formatting updates:
https://github.com/python/typing_extensions/commit/fb77519b198f9d610ee8f674e27b8ce1da00f61f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-extensions/python-typing-extensions.hash | 6 +++---
 package/python-typing-extensions/python-typing-extensions.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index 2512ed042d..249bb63a42 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  30ff8c89459dd93970a92a90b0386aba  typing_extensions-4.3.0.tar.gz
-sha256  e6d2677a32f47fc7eb2795db1dd15c1f34eff616bcaf2cfb5e997f854fa1c4a6  typing_extensions-4.3.0.tar.gz
+md5  5cfcb56ea6fc4972c3600c0030f4d136  typing_extensions-4.4.0.tar.gz
+sha256  1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa  typing_extensions-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
+sha256  c7afb65e755707b9fb90487389a176d3ed3d0031d5131afde45c23715ff5e891  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 2b8c23f354..fd7d0bd93a 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.3.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.4.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/9e/1d/d128169ff58c501059330f1ad96ed62b79114a2eb30b8238af63a2e27f70
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/e3/a7/8f4e456ef0adac43f452efc2d0e4b242ab831297f1bac60ac815d37eb9cf
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
