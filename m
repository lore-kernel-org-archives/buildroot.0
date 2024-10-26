Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A087ED10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7120640346;
	Sat, 26 Oct 2024 20:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhDrMmCWnGlM; Sat, 26 Oct 2024 20:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA53540333
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA53540333;
	Sat, 26 Oct 2024 20:56:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D195C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1821240166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBssyM34e5nt for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 059DF40254
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059DF40254
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39768424F; Sat, 26 Oct 2024 20:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:53:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de5d167df20c33892c5c5048d26361c7793d8111
X-Git-Newrev: 06958532f9ea2c4c87f4affec1bb296da024418d
X-Patchwork-Hint: ignore
Message-Id: <20241026205647.F39768424F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markupsafe: bump to version
 3.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=06958532f9ea2c4c87f4affec1bb296da024418d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 8902d3d0ec..c5ba015592 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  202a35d8c8309cd6e70f8b03c5eb7b61  markupsafe-3.0.1.tar.gz
-sha256  3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344  markupsafe-3.0.1.tar.gz
+md5  cb0071711b573b155cc8f86e1de72167  markupsafe-3.0.2.tar.gz
+sha256  ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0  markupsafe-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index c96207d14b..11e8708270 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 3.0.1
+PYTHON_MARKUPSAFE_VERSION = 3.0.2
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b4/d2/38ff920762f2247c3af5cbbbbc40756f575d9692d381d7c520f45deb9b8f
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
