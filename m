Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502BAC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05F960C28;
	Mon,  5 Dec 2022 11:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05F960C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VR97sLH7tsxO; Mon,  5 Dec 2022 11:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D4560DC6;
	Mon,  5 Dec 2022 11:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D4560DC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3DF1BF955
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB503405AC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB503405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHQM4WHMtNZI for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0EF40522
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD0EF40522
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC42585B9B; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6945c4d31c9088f030c6b254a1ef202a28e84c6
X-Git-Newrev: 439f553b6c7d84fc04cef3e69f9473c6e8161f45
X-Patchwork-Hint: ignore
Message-Id: <20221205112604.AC42585B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyrsistent: bump to version
 0.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=439f553b6c7d84fc04cef3e69f9473c6e8161f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyrsistent/python-pyrsistent.hash | 4 ++--
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index 70d1cc6fa2..bb55c7135d 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  cef3da08455664bf917dcf8cd00d49a4  pyrsistent-0.18.1.tar.gz
-sha256  d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96  pyrsistent-0.18.1.tar.gz
+md5  23da81256b8817e123568a858bf78997  pyrsistent-0.19.2.tar.gz
+sha256  bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2  pyrsistent-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index 27ec41028f..6a5ac30a15 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.18.1
+PYTHON_PYRSISTENT_VERSION = 0.19.2
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/42/ac/455fdc7294acc4d4154b904e80d964cc9aae75b087bbf486be04df9f2abd
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/b8/ef/325da441a385a8a931b3eeb70db23cb52da42799691988d8d943c5237f10
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
