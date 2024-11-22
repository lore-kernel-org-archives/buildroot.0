Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23108E6916C
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 16:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945FA613A5;
	Fri, 22 Nov 2024 16:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPlbKdm8gz2y; Fri, 22 Nov 2024 16:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC9F613A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC9F613A6;
	Fri, 22 Nov 2024 16:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 073ED4E70
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E852381318
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvDWh7JAwTsC for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 16:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1CF8130F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1CF8130F
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F6E6865B5; Fri, 22 Nov 2024 16:16:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Nov 2024 17:08:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 65c68f9b69c252d409b414e444212d520ca2bf46
X-Git-Newrev: 853c3d62c5afd2da7a271f1572b3cbaf62800901
X-Patchwork-Hint: ignore
Message-Id: <20241122161629.2F6E6865B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bootgen: bump to
 xilinx_v2024.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=853c3d62c5afd2da7a271f1572b3cbaf62800901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump bootgen to xilinx_v2024.2 release.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bootgen/bootgen.hash | 2 +-
 package/bootgen/bootgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index 506aae8a84..d040a2e280 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7879c7d40642bcf7adcec177a51cf73f95bd45d315f75d125d3fc1680c0a9b24  bootgen-xilinx_v2024.1.tar.gz
+sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
 sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 912e2e31b3..51eacde462 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2024.1
+BOOTGEN_VERSION = xilinx_v2024.2
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
