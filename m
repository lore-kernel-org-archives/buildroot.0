Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D965CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 10:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0754821BB;
	Sun, 19 Oct 2025 10:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaqzrCpM0VFe; Sun, 19 Oct 2025 10:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4C382016
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4C382016;
	Sun, 19 Oct 2025 10:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 890E81CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F63F40A5E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBVCMds3kovH for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 10:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69CD640A48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69CD640A48
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5868F8744F; Sun, 19 Oct 2025 10:24:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 11:01:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cbb39d4d2c2664b91c5862e2e3ec472c8194cb9
X-Git-Newrev: efbbf91958c31b3360f2cd4e893315aba8dd782c
X-Patchwork-Hint: ignore
Message-Id: <20251019102417.5868F8744F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-{headers,
 tools}: bump to version 1.4.328.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efbbf91958c31b3360f2cd4e893315aba8dd782c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated spirv-headers license hash due to upstream commit:
https://github.com/KhronosGroup/SPIRV-Headers/commit/e87f5a873192cdfddc94aea0a4dbd63059b0773c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-headers/spirv-headers.hash | 4 ++--
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 6e3cc33d6b..c62d12a79a 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f68be549d74afb61600a1e3a7d1da1e6b7437758c8e77d664909f88f302c5ac1  spirv-headers-1.4.313.0.tar.gz
-sha256  ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084  LICENSE
+sha256  602364ab7bf404a7f352df7da5c645f1c4558a9c92616f8ee33422b04d5e35b7  spirv-headers-1.4.328.1.tar.gz
+sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 675cef9f16..9312e96d41 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.313.0
+SPIRV_HEADERS_VERSION = 1.4.328.1
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index de118b378e..e3652a48cd 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b60f723345ceed5291cceebbcfacf7fea9361a69332261fa08ae57e2a562005  spirv-tools-1.4.313.0.tar.gz
+sha256  d00dc47df7163c2bacd70f090441e8fad96234f0e3b96c54ee9091a49e627adb  spirv-tools-1.4.328.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index 1aa0cc6199..c71a0f8299 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.313.0
+SPIRV_TOOLS_VERSION = 1.4.328.1
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
