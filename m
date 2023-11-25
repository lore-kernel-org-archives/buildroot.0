Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558F2C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AB4A4191A;
	Mon,  4 Dec 2023 20:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB4A4191A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5fW2gkN4Ju8; Mon,  4 Dec 2023 20:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5D041913;
	Mon,  4 Dec 2023 20:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5D041913
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0831BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3160FFF
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB3160FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW35hgwWHqRX for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1888F60B09
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1888F60B09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14EA3879B7; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:24:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4749c6f82a2009ab9b7ae084a60344344b98f11
X-Git-Newrev: 6c70212a09253eb5fb79c715e7fff7fb786a74ba
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.14EA3879B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: bump to version
 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c70212a09253eb5fb79c715e7fff7fb786a74ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index b327a6b8a9..abc62fc8c2 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  3f49814473cc153a7189fec31cfacfab  paramiko-2.12.0.tar.gz
-sha256  376885c05c5d6aa6e1f4608aac2a6b5b0548b1add40274477324605903d9cd49  paramiko-2.12.0.tar.gz
+md5  08b1610e3ba9fa89e13973710cd48e35  paramiko-3.3.1.tar.gz
+sha256  6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77  paramiko-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 621176ed41..512a4630f5 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.12.0
+PYTHON_PARAMIKO_VERSION = 3.3.1
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/98/75/e78ddbe671a4a59514b59bc6a321263118e4ac3fe88175dd784d1a47a00f
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/44/03/158ae1dcb950bd96f04038502238159e116fafb27addf5df1ba35068f2d6
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
