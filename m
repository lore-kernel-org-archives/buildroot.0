Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD8C48260
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C4081E90;
	Mon,  5 Feb 2024 22:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C4081E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZi0cfaPjXHR; Mon,  5 Feb 2024 22:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC7E81E65;
	Mon,  5 Feb 2024 22:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC7E81E65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1721BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0704460D68
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0704460D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaToscgEZ9u6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32EC560608
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32EC560608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D9F086EAB; Mon,  5 Feb 2024 22:48:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:48:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb803fbd91e0b6c0d74a90a15858d18743ed68bc
X-Git-Newrev: beef64d5ea34577f7539d4323d05a0c59bd612c9
X-Patchwork-Hint: ignore
Message-Id: <20240205224845.1D9F086EAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hwdata: bump to version
 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=beef64d5ea34577f7539d4323d05a0c59bd612c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required license file download.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-hwdata/python-hwdata.hash |  6 +++---
 package/python-hwdata/python-hwdata.mk   | 13 ++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/python-hwdata/python-hwdata.hash b/package/python-hwdata/python-hwdata.hash
index 0c7ca31476..57c2dd0003 100644
--- a/package/python-hwdata/python-hwdata.hash
+++ b/package/python-hwdata/python-hwdata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hwdata/json
-md5  dccf3b28d06fb9c6f56875e148356c24  hwdata-2.3.7.tar.gz
-sha256  9e5c96be38d9218ffde40834d4ca03344b8dfaed29c8c5afe0030125ea03db03  hwdata-2.3.7.tar.gz
-# Locally computed
+md5  0344fe7a3e21041c2ef0ed36ee2bef18  hwdata-2.4.1.tar.gz
+sha256  9bad80237c81cc091615179d665a3ef1213acca4caa378ff037c81f34538cde9  hwdata-2.4.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/python-hwdata/python-hwdata.mk b/package/python-hwdata/python-hwdata.mk
index 5e968ce847..c277eebccc 100644
--- a/package/python-hwdata/python-hwdata.mk
+++ b/package/python-hwdata/python-hwdata.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HWDATA_VERSION = 2.3.7
+PYTHON_HWDATA_VERSION = 2.4.1
 PYTHON_HWDATA_SOURCE = hwdata-$(PYTHON_HWDATA_VERSION).tar.gz
-PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/15/26/f5bc1b42129fbcbd1c99c29714af1685fc89e2cf37680a9930d4fcac1808
+PYTHON_HWDATA_SITE = https://files.pythonhosted.org/packages/ff/ec/4a6e57d765a63f7e9a8c5348f0bf3f7d39243dc5bc695fa1e887ca5856c8
 PYTHON_HWDATA_SETUP_TYPE = setuptools
 PYTHON_HWDATA_LICENSE = GPL-2.0+
 PYTHON_HWDATA_LICENSE_FILES = LICENSE
 
-# There is no LICENSE file in the PyPi tarball, but it is available in
-# upstream git repository:
-PYTHON_HWDATA_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xsuchy/python-hwdata/python-hwdata-$(PYTHON_HWDATA_VERSION)-1/LICENSE
-
-define PYTHON_HWDATA_ADD_LICENSE_FILE
-	cp $(PYTHON_HWDATA_DL_DIR)/LICENSE $(@D)
-endef
-PYTHON_HWDATA_POST_EXTRACT_HOOKS += PYTHON_HWDATA_ADD_LICENSE_FILE
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
