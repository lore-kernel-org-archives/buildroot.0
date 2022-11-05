Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F89C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED8581B14;
	Sat,  5 Nov 2022 22:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED8581B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pfcva4B6DnZ3; Sat,  5 Nov 2022 22:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3A281A58;
	Sat,  5 Nov 2022 22:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3A281A58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 121951BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6B640467
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6B640467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wjZns0PVDHj for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:11:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84604032A
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D84604032A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C821287F3E; Sat,  5 Nov 2022 22:11:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eec577b143830d554ca65b9c2e5b2c1209567ff3
X-Git-Newrev: 3c79a8ba80d984bfa42b4868dc4cbd474381efd3
X-Patchwork-Hint: ignore
Message-Id: <20221105221107.C821287F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-xlsxwriter:
 bump to version 3.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c79a8ba80d984bfa42b4868dc4cbd474381efd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to date update:
https://github.com/jmcnamara/XlsxWriter/commit/0fc418931f984e5d6119569d47e9985b2bae5d57

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 7c9698067b..4363799079 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  5f759dccf222e8f2a9924e90c4afaf84  XlsxWriter-3.0.1.tar.gz
-sha256  3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a  XlsxWriter-3.0.1.tar.gz
+md5  b08fcc4753c14aa64b9d99219475d91e  XlsxWriter-3.0.3.tar.gz
+sha256  e89f4a1d2fa2c9ea15cde77de95cd3fd8b0345d0efb3964623f395c8c4988b7f  XlsxWriter-3.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256  8fbb9b28ef0afac1c7d999102fd2634f347448d069c8c821976f3dbd2b3f812c  LICENSE.txt
+sha256  6287be39bd007c8729f5c3cf8dfda9b462af725c1d06e3bf0e17b1532196a08f  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 4c8a512086..4055e52622 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.0.1
+PYTHON_XLSXWRITER_VERSION = 3.0.3
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/5d/36/e943d07af9d26cc2f11861955dbf0031e891f77f3d55f70217fd6a0f4d9f
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/53/04/91ff43803c3e88c32aa272fdbda5859fc3c3b50b0de3a1e439cc57455330
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
