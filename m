Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD01C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825D360BC9;
	Mon,  5 Dec 2022 11:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825D360BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG0I5doqh71j; Mon,  5 Dec 2022 11:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9D6607CA;
	Mon,  5 Dec 2022 11:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE9D6607CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A481BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDBA0405F7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDBA0405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvcFe93pcWSA for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2C21405D2
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2C21405D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFCB985B9E; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed582011f9a467dc044e05ed306b31bd10996eb8
X-Git-Newrev: 035211b4648847ad624b4216d6e3a9e186d70121
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.CFCB985B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tempora: bump to version
 5.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=035211b4648847ad624b4216d6e3a9e186d70121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to line wrap:
https://github.com/jaraco/tempora/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 0fca58354b..d802a63d87 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  f8b2b0df1adf3f83b829a85e31bddb2d  tempora-1.14.1.tar.gz
-sha256  cb60b1d2b1664104e307f8e5269d7f4acdb077c82e35cd57246ae14a3427d2d6  tempora-1.14.1.tar.gz
+md5  24b77c173a7e89084004a38fe44e3ce3  tempora-5.0.2.tar.gz
+sha256  31fa5bb33b2641026211f23e808eb8bd351901988b167d45f323c8f450ecf211  tempora-5.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index b2f1b6b309..e22ac52472 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 1.14.1
+PYTHON_TEMPORA_VERSION = 5.0.2
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/2f/b5/5b0464385454c5ca93a39a1c6acefdf574aeb10ef45fa8958b3832cc7d96
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/72/2c/9aff4204a4ea5172b0cb3508f8a504ab6562ba539825ea2e33a5b4cb629b
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
