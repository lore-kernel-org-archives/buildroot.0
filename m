Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51298C47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D2D60BD9;
	Mon,  5 Dec 2022 11:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D2D60BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJc9S47Yb-ZS; Mon,  5 Dec 2022 11:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E9260B30;
	Mon,  5 Dec 2022 11:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E9260B30
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1012B1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8686341620
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8686341620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBDgPfyDnAou for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A13415FF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A13415FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DC385BA3; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cbff2f1b4848a3bc2d2df428b10f3b377a9fc56
X-Git-Newrev: 4b47bf463981fb14359857b8336fd9b1dfc49c21
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.A1DC385BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathpy: bump to version
 12.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b47bf463981fb14359857b8336fd9b1dfc49c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pathpy/python-pathpy.hash | 4 ++--
 package/python-pathpy/python-pathpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index 0b9b7b7cd6..f2f1880e4d 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path.py/json
-md5  307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
-sha256  9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
+md5  c748063e113914dcb08e3f4eb6cd1de0  path.py-12.5.0.tar.gz
+sha256  8d885e8b2497aed005703d94e0fd97943401f035e42a136810308bff034529a8  path.py-12.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 3b7388bdd2..2fd6e931f8 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 12.0.1
+PYTHON_PATHPY_VERSION = 12.5.0
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/70/63/c01c1bb2df17db4c78f78cc439a2800f55bec5445cabf1f3579a37909f41
+PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/b6/e3/81be70016d58ade0f516191fa80152daba5453d0b07ce648d9daae86a188
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
 PYTHON_PATHPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
