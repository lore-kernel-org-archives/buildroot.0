Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F178C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238B342CF1;
	Fri, 28 Feb 2025 16:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKTtBT-zGhyh; Fri, 28 Feb 2025 16:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7013B4FA78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7013B4FA78;
	Fri, 28 Feb 2025 16:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E0B3711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C5F42539
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykr_476pam3n for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEC0241867
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEC0241867
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7CD57FD48; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 13:56:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a6de4cf11b44c11f35705b349979cd65b6906e73
X-Git-Newrev: 3960334ba26c5f7235e5865c3d61ccef901aefe7
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.A7CD57FD48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-aiohappyeyeballs: bump to version 2.4.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3960334ba26c5f7235e5865c3d61ccef901aefe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index 85938c1084..069dad89cf 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  dcc0ba52e3c350f4edc8a8475d1892d6  aiohappyeyeballs-2.4.3.tar.gz
-sha256  75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586  aiohappyeyeballs-2.4.3.tar.gz
+md5  57d956f516c6558674f6248d8ba38321  aiohappyeyeballs-2.4.4.tar.gz
+sha256  5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745  aiohappyeyeballs-2.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 2a2c10fb37..9669b04793 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.3
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.4
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/bc/69/2f6d5a019bd02e920a3417689a89887b39ad1e350b562f9955693d900c40
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/7f/55/e4373e888fdacb15563ef6fa9fa8c8252476ea071e96fb46defac9f18bf2
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
