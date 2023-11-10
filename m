Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC5C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D48742717;
	Fri, 10 Nov 2023 21:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D48742717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNplPrJ6D276; Fri, 10 Nov 2023 21:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F85442847;
	Fri, 10 Nov 2023 21:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F85442847
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15FE1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26E960B88
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26E960B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZgPA9PAegXV for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035636F6F7
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035636F6F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E057786FE9; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:06:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53931943ebeb60f57736d01f490351ddc971574f
X-Git-Newrev: 6273b2f85d1d18f7f7afc8d3e321df134b36c2b3
X-Patchwork-Hint: ignore
Message-Id: <20231110211108.E057786FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-constantly: bump version to
 23.10.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6273b2f85d1d18f7f7afc8d3e321df134b36c2b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package now requires host-python-versioneer to build.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-constantly/python-constantly.hash | 4 ++--
 package/python-constantly/python-constantly.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index 8e646d82ba..7a246e882a 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/constantly/json
-md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+md5  c090579309b2b34be04385b54b0a5a85  constantly-23.10.4.tar.gz
 # Locally computed
-sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd  constantly-23.10.4.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 783d198d06..466c9bf455 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CONSTANTLY_VERSION = 15.1.0
+PYTHON_CONSTANTLY_VERSION = 23.10.4
 PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_SITE = https://files.pythonhosted.org/packages/4d/6f/cb2a94494ff74aa9528a36c5b1422756330a75a8367bf20bd63171fc324d
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
+PYTHON_CONSTANTLY_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
