Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64610C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86C860751;
	Sat, 14 Sep 2024 07:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMNb1Pj1GAdW; Sat, 14 Sep 2024 07:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6938607D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6938607D8;
	Sat, 14 Sep 2024 07:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6D51BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B05180B63
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUyZLmcDgzI3 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 971A580C16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971A580C16
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4754286F44; Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 00:22:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 426e91e977d302015e748c4310ca75084085c091
X-Git-Newrev: cc558477c33280a5e421793646f2c52ae2154223
X-Patchwork-Hint: ignore
Message-Id: <20240914073123.4754286F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiojobs: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc558477c33280a5e421793646f2c52ae2154223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index baaa61b331..d5721dc6d0 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  d4742018c2188147f1efa41645b5758b  aiojobs-1.2.1.tar.gz
-sha256  59d6e7ad7829e9d0f73bfceeae28153b541be6b0959a08cc5ceb222717c888ff  aiojobs-1.2.1.tar.gz
+md5  efad80daa647b6346258f1027da44c8b  aiojobs-1.3.0.tar.gz
+sha256  03074c884b3dc388b8d798c0de24ec17d72b2799018497fda8062c0431a494b5  aiojobs-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 9e4a55e13c..e8ada82305 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.2.1
+PYTHON_AIOJOBS_VERSION = 1.3.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/07/ad/e4240f9225022798e0e651ced8f6dc022e88eae4f2df6e1482a8f3c0d54d
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/0b/d612a769c28bd22bcc52b369a9a10c63eb6e7b5e2e0cfb35e3be7357fe29
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
