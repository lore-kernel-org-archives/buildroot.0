Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFEBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE125408FF;
	Sat,  5 Feb 2022 22:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYqSDeqDZdoV; Sat,  5 Feb 2022 22:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0363840905;
	Sat,  5 Feb 2022 22:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 791781BF962
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F0024088D
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPs04LwLPOf6 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A572B4087C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A545A82AE5; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:34:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5654af1bae4c56af914d2d948cbe2dd1ae4de88
X-Git-Newrev: bf7c819f1ea0dd699d886dba1b7db177acc90b1a
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.A545A82AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dataproperty: bump to
 version 0.54.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf7c819f1ea0dd699d886dba1b7db177acc90b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/thombashi/DataProperty/releases/tag/v0.54.2
https://github.com/thombashi/DataProperty/releases/tag/v0.54.1
https://github.com/thombashi/DataProperty/releases/tag/v0.54.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 9a8c250125..380846e9f1 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/DataProperty/json
-md5  6a6930ae266399df58707a13a5f0cfa6  DataProperty-0.53.0.tar.gz
-sha256  9589b5c5b400a77e1aeb63d89d755043bbe00043219336963c93db5df49cbaf7  DataProperty-0.53.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dataproperty/json
+md5  ce5fd0d37b6d0ca57f144e22cd62bfec  DataProperty-0.54.2.tar.gz
+sha256  df2fcf00e7a57f0a6089f686f847527eb3c91ded5c419daef6d06ee4bb1187b4  DataProperty-0.54.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 5ceb7f72f5..1b07dc1bb7 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.53.0
+PYTHON_DATAPROPERTY_VERSION = 0.54.2
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/df/d0/36deb707996c5ef48ab353804291f44f59bd9d46875c384d163ad106df1a
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/9a/03/44fb9094c4fb8032f254eaa37b3b07db82fa35779ceca097b3cde8464749
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
