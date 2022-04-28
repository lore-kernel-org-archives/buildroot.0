Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E076C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A65140C68;
	Thu, 28 Apr 2022 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MioIUF17PhSW; Thu, 28 Apr 2022 21:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5DBF40C5B;
	Thu, 28 Apr 2022 21:09:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E149F1C115D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC27441BF4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrkTqXVSm5Ji for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F71F41BF1
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3392C846A1; Thu, 28 Apr 2022 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:00:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8d1631d9255305d80aab8038b0145c195997272
X-Git-Newrev: 6f93ce0d1c29649dea3eb0fee5e1da4b577f4d3e
X-Patchwork-Hint: ignore
Message-Id: <20220428205845.3392C846A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 62.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f93ce0d1c29649dea3eb0fee5e1da4b577f4d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 1a378d1b76..d4a9ba3d88 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  6c6a97cf68e1db789a2e5c054f067278  setuptools-60.9.3.tar.gz
-sha256  2347b2b432c891a863acadca2da9ac101eae6169b1d3dfee2ec605ecd50dbfe5  setuptools-60.9.3.tar.gz
+md5  95f4924aacd634ab579f17fc71f79fb1  setuptools-62.1.0.tar.gz
+sha256  47c7b0c0f8fc10eec4cf1e71c6fdadf8decaa74ffa087e68cd1c20db7ad6a592  setuptools-62.1.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3309cd9df4..c6a2137e1d 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 60.9.3
+PYTHON_SETUPTOOLS_VERSION = 62.1.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/14/74/54890935244ce053abcc4fa01ef4982a84743a8d128d4cf5eae56e2d156c
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ea/a3/3d3cbbb7150f90c4cf554048e1dceb7c6ab330e4b9138a40e130a4cc79e1
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
