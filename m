Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70EDC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449DA8445F;
	Sun, 15 Sep 2024 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhcaiW2huYOt; Sun, 15 Sep 2024 21:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D2684A05
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D2684A05;
	Sun, 15 Sep 2024 21:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6071BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B0666088E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNy1SJTg6GZx for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD276608BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD276608BA
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A966F835CD; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:35:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1806307ce365e526ac5d121d570cae780a4b861d
X-Git-Newrev: 069add3bcc5c6be3a88981852a2f13b9a012fdaf
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.A966F835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-incremental: bump to
 version 24.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=069add3bcc5c6be3a88981852a2f13b9a012fdaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-incremental/python-incremental.hash | 4 ++--
 package/python-incremental/python-incremental.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index 456e8ca16d..7707495a0a 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5  9fffa2490ca649550c79a78e85ef2eef  incremental-22.10.0.tar.gz
-sha256  912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0  incremental-22.10.0.tar.gz
+md5  d946fb1a369c77693b4dab8ac9b13596  incremental-24.7.2.tar.gz
+sha256  fb4f1d47ee60efe87d4f6f0ebb5f70b9760db2b2574c59c8e8912be4ebd464c9  incremental-24.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 4b032d2649..9a1432ebd2 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 22.10.0
+PYTHON_INCREMENTAL_VERSION = 24.7.2
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/86/42/9e87f04fa2cd40e3016f27a4b4572290e95899c6dce317e2cdb580f3ff09
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/27/87/156b374ff6578062965afe30cc57627d35234369b3336cf244b240c8d8e6
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
