Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60790846CF;
	Fri, 28 Feb 2025 17:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNuPlgz2oAVg; Fri, 28 Feb 2025 17:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671DA844A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671DA844A9;
	Fri, 28 Feb 2025 17:04:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1104E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33854424FE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViwjpNc5CT3i for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0926D42EA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0926D42EA3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F305F82581; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 15:43:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4fdf6cf16ff1bd098f96fdb8d4724669dbe8c0ec
X-Git-Newrev: 0a0169070ef9c2961b6515f184c9a3daa6d84ba9
X-Patchwork-Hint: ignore
Message-Id: <20250228163019.F305F82581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-semver: bump to
 version 3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a0169070ef9c2961b6515f184c9a3daa6d84ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to placeholder replacement:
https://github.com/python-semver/python-semver/commit/c47774db88386f7db79e5ec9fe3672c07ed7c063

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-semver/python-semver.hash | 6 +++---
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 1e06167610..50d30dd2fb 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  0bbc4d74959c9f1522f75ffb4ae0934d  semver-3.0.2.tar.gz
-sha256  6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc  semver-3.0.2.tar.gz
+md5  a0d76b528e489bf7ce1255a0a1486123  semver-3.0.4.tar.gz
+sha256  afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602  semver-3.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
+sha256  cc10179de9ced8655d7765bd3a8ac46438a61e663de7cf1c48d502d2baf9f3d5  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 65faa8a851..3e4b167848 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 3.0.2
+PYTHON_SEMVER_VERSION = 3.0.4
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/41/6c/a536cc008f38fd83b3c1b98ce19ead13b746b5588c9a0cb9dd9f6ea434bc
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/72/d1/d3159231aec234a59dd7d601e9dd9fe96f3afff15efd33c1070019b26132
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
