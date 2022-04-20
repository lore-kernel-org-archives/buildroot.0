Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD05C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 658BA61350;
	Wed, 20 Apr 2022 20:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eW80-k2PK0id; Wed, 20 Apr 2022 20:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B5E6114D;
	Wed, 20 Apr 2022 20:43:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8001F1C113E
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 441886115E
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0wZUlxkN_ms for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7505A60E69
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7FA9083F5A; Wed, 20 Apr 2022 20:32:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:37:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ce665083a2d81f3caf6d48dfc88c76c3fced06d
X-Git-Newrev: c7acb13bc6f5bdf87c088d0504d6962e0c966c4e
X-Patchwork-Hint: ignore
Message-Id: <20220420203211.7FA9083F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect2: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7acb13bc6f5bdf87c088d0504d6962e0c966c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index fd892e297f..ffbafdfd40 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  6206ebccfdd9fc02196f60e830fa7b1f  cssselect2-0.5.0.tar.gz
-sha256  d98a7bbdd8ebc46093279195d669a3359bd5a23f90c19e82c19d9eeef333e617  cssselect2-0.5.0.tar.gz
+md5  cb5630e049172f431aeb82a3d504664a  cssselect2-0.6.0.tar.gz
+sha256  5b5d6dea81a5eb0c9ca39f116c8578dd413778060c94c1f51196371618909325  cssselect2-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index b3ddf41fef..0e34059e75 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.5.0
+PYTHON_CSSSELECT2_VERSION = 0.6.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ce/e7/1333b9042beb33a9bb425900b6d9b59035b98c31c950a323d14ceca1275e
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/68/62/b6a16d0c32bb088079f344202e3cd0936380a4d8cb23ef9b1f8079ff8612
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
