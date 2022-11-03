Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAEBC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA3F40222;
	Mon,  5 Dec 2022 11:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA3F40222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2ybeGLivqie; Mon,  5 Dec 2022 11:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491CF40259;
	Mon,  5 Dec 2022 11:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491CF40259
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB03B1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6DC41674
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC6DC41674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24kfmd0omy5z for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC3CE41621
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC3CE41621
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA6C985BA3; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 331393e8a5903fa5b41e7854c02b56f3c0b168a5
X-Git-Newrev: 3cbc054f7f560a058c0b380bcf650a15dcd25a18
X-Patchwork-Hint: ignore
Message-Id: <20221205112605.BA6C985BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqliteschema: bump to
 version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cbc054f7f560a058c0b380bcf650a15dcd25a18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index e60bd64325..d5fe6e7af1 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5  4fb0130e7cc60d92be468091fbfc3d51  sqliteschema-1.2.1.tar.gz
-sha256  dde195bd7bc70d5841bc01dff20ec23bd43be87d760d2dfc7c7f2e5fd3808ef3  sqliteschema-1.2.1.tar.gz
+md5  46da4f7575a0cc6c1d92377a279e5188  sqliteschema-1.3.0.tar.gz
+sha256  1acdd5087cab54a099135a5623bb1960019816e2e3042b889c637901a832d3c3  sqliteschema-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 5c52e35111..c399ebd6f6 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 1.2.1
+PYTHON_SQLITESCHEMA_VERSION = 1.3.0
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/85/f8/be54d4bebf551cb533d1dea11c3bf165a1a408c2a1cceb1f9724aadd9967
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/3d/ff/91cfff0c96f9ba2bddc27d6855db4907af77551a267b86740c8842beeb78
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
