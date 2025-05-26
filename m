Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE70C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5725A60AD1;
	Sat, 31 May 2025 16:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzJz--4UVz7F; Sat, 31 May 2025 16:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CDC60859
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1CDC60859;
	Sat, 31 May 2025 16:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB02235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 110B183C85
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrCDhMPF_vvG for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2BE83C60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2BE83C60
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0934F87578; Sat, 31 May 2025 16:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:48:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 32c32c728ba7078d242718fd981235a95c2dc564
X-Git-Newrev: a23909547ff8f82b4e355853ed19ee226a0581d6
X-Patchwork-Hint: ignore
Message-Id: <20250531165510.0934F87578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/catch2: bump
 version to 3.8.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a23909547ff8f82b4e355853ed19ee226a0581d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

- Fixed bug where catch_discover_tests fails when no TEST_CASEs are present

release notes: https://github.com/catchorg/Catch2/releases/tag/v3.8.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Peter: reword commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4bf58850eabad4ed393e170b06d7c55f9de9f702)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 3b203285bf..30ff1f43b3 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1ab2de20460d4641553addfdfe6acd4109d871d5531f8f519a52ea4926303087  catch2-3.8.0.tar.gz
+sha256  18b3f70ac80fccc340d8c6ff0f339b2ae64944782f8d2fca2bd705cf47cadb79  catch2-3.8.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 5d46fb3ffd..00d6e5bfdc 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.8.0
+CATCH2_VERSION = 3.8.1
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
