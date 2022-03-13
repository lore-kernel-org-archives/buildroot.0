Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8384560EA1;
	Sun, 13 Mar 2022 09:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0KmkxMh2XG6; Sun, 13 Mar 2022 09:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4026560EB0;
	Sun, 13 Mar 2022 09:11:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E48331BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D76C40993
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lk6fIoKIVY4B for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52B140997
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AE33A83A68; Sun, 13 Mar 2022 09:02:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:10:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23b555a6ccfb80eb3d6065df753986c60b99a7a0
X-Git-Newrev: 1a1604d228d26bdbb61b2ce18329ef54e9581688
X-Patchwork-Hint: ignore
Message-Id: <20220313090240.AE33A83A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: bump to version
 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a1604d228d26bdbb61b2ce18329ef54e9581688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 68af457664..543bd0fa62 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  cf7b8f470620c54f2d28167fc80542a7  installer-0.4.0.tar.gz
-sha256  17d7ca174039fbd85f268e16042e3132ebb03d91e1bbe0f63b9ec6b40619414a  installer-0.4.0.tar.gz
+md5  bf17db5e6b58c4cfa33642f5348d3814  installer-0.5.1.tar.gz
+sha256  f970995ec2bb815e2fdaf7977b26b2091e1e386f0f42eafd5ac811953dc5d445  installer-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 82739a8003..862a251415 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.4.0
+PYTHON_INSTALLER_VERSION = 0.5.1
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d51336453e75f76b32de86b336ef26755c64119204f1f5b4388
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = distutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
