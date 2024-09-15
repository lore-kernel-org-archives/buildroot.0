Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DEC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CC780B51;
	Sun, 15 Sep 2024 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CPP4GU-Hq6g; Sun, 15 Sep 2024 21:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10EE080513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EE080513;
	Sun, 15 Sep 2024 21:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB0E1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8F86088C
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbFTn8buB8O8 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C9F608A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C9F608A8
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0396F835CD; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67562a9f1e27a4ce3fd775e53dfe096c6754fed6
X-Git-Newrev: cd3949abd48e010c3819447d113ce38556bd2076
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.0396F835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gast: bump to version 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd3949abd48e010c3819447d113ce38556bd2076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index 9ce5296938..4071a07919 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  907c689e3fdbc7a48cc010e665195baa  gast-0.5.4.tar.gz
-sha256  9c270fe5f4b130969b54174de7db4e764b09b4f7f67ccfc32480e29f78348d97  gast-0.5.4.tar.gz
+md5  4a088eca6fd6bae16bc2fd2ff828de51  gast-0.6.0.tar.gz
+sha256  88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb  gast-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index 0db1dbe93e..771d7a4be4 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.5.4
+PYTHON_GAST_VERSION = 0.6.0
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/e4/41/f26f62ebef1a80148e20951a6e9ef4d0ebbe2090124bc143da26e12a934c
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/3c/14/c566f5ca00c115db7725263408ff952b8ae6d6a4e792ef9c84e77d9af7a1
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
