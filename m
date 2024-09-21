Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F40CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55626084F;
	Sat, 21 Sep 2024 21:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8MyKQpmMAl3; Sat, 21 Sep 2024 21:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F1A608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F1A608A1;
	Sat, 21 Sep 2024 21:09:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6281BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9359F60643
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEk55eGV66uG for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53FEB6070D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53FEB6070D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5124D84174; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81ca1488648059e73fc1572f799a2b654eaf1392
X-Git-Newrev: d1aaab41ce30896f60e7e02df604bbbd3284af83
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.5124D84174@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycups: bump to version
 2.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1aaab41ce30896f60e7e02df604bbbd3284af83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycups/python-pycups.hash | 4 ++--
 package/python-pycups/python-pycups.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycups/python-pycups.hash b/package/python-pycups/python-pycups.hash
index d1498b61cf..d6b7963cfc 100644
--- a/package/python-pycups/python-pycups.hash
+++ b/package/python-pycups/python-pycups.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycups/json
-md5  41eef188b86d01ccfdbaaa05cf0f6ca4  pycups-2.0.1.tar.gz
-sha256  57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90  pycups-2.0.1.tar.gz
+md5  a4e9bcdc2012fcff660e0806416a1fb3  pycups-2.0.4.tar.gz
+sha256  843e385c1dbf694996ca84ef02a7f30c28376035588f5fbeacd6bae005cf7c8d  pycups-2.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-pycups/python-pycups.mk b/package/python-pycups/python-pycups.mk
index bf61400afe..60f4b483f7 100644
--- a/package/python-pycups/python-pycups.mk
+++ b/package/python-pycups/python-pycups.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCUPS_VERSION = 2.0.1
+PYTHON_PYCUPS_VERSION = 2.0.4
 PYTHON_PYCUPS_SOURCE = pycups-$(PYTHON_PYCUPS_VERSION).tar.gz
-PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/0c/bb/82546806a86dc16f5eeb76f62ffdc42cce3d43aacd4e25a8b5300eec0263
+PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/96/c4/b077f0422cd031e4f3a47c75ce0bcf77f2f2e5bf3648f6945a4d09fd44a5
 PYTHON_PYCUPS_SETUP_TYPE = setuptools
 PYTHON_PYCUPS_LICENSE = GPL-2.0+
 PYTHON_PYCUPS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
