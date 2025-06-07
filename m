Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5731CC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6C4617AE;
	Thu, 12 Jun 2025 08:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cECcrKETYVWN; Thu, 12 Jun 2025 08:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFB3860E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB3860E80;
	Thu, 12 Jun 2025 08:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB251E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB35421EE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hv73c2byJiVD for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3331C42140
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3331C42140
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FEE2811D1; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Jun 2025 21:25:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c01b9e764168c3588c491a8b3d6c14ee8223e01c
X-Git-Newrev: 2f4a9223765ea3c4fe3160fb8db80cea8c17e6c7
X-Patchwork-Hint: ignore
Message-Id: <20250612083833.2FEE2811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-clhpp: bump version to
 v2024.10.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f4a9223765ea3c4fe3160fb8db80cea8c17e6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump opencl-clhpp to the latest version "v2024.10.24".

https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2024.10.24

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: reword commit title to include the version name]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencl-clhpp/opencl-clhpp.hash | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index 184444a53a..add8563757 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  22921fd23ca72a21ac5592861d64e7ea53cd8a705fccd73905911f8489519a0b  opencl-clhpp-2024.05.08.tar.gz
+sha256  51aebe848514b3bc74101036e111f8ee98703649eec7035944831dc6e05cec14  opencl-clhpp-2024.10.24.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 2b5d5afa4b..4bff6ad73a 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
-OPENCL_CLHPP_VERSION = 2024.05.08
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+
+OPENCL_CLHPP_VERSION = 2024.10.24
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
