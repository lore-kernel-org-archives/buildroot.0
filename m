Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A63CC54754
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5976660638;
	Sat, 17 May 2025 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Koa2r1l3UnYI; Sat, 17 May 2025 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA7960733
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CA7960733;
	Sat, 17 May 2025 20:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD1BE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A99E408C1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kss4dM-DneFG for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E76407F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4E76407F5
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:39:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A64FA8703B; Sat, 17 May 2025 20:39:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 22:36:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b34e0d27ab8a9529cbc0df3ade7f9eedca50041f
X-Git-Newrev: 7bc90fa3eb6b4bb1a1cd713faea14ab27ba61ea0
X-Patchwork-Hint: ignore
Message-Id: <20250517203920.A64FA8703B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/blake3: bump version to 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bc90fa3eb6b4bb1a1cd713faea14ab27ba61ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 1.5.4, see:
https://github.com/BLAKE3-team/BLAKE3/releases

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/blake3/blake3.hash | 2 +-
 package/blake3/blake3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 9c3792edf6..6bcfefb2b8 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,5 +1,5 @@
 # sha256 computed locally
-sha256  ddd24f26a31d23373e63d9be2e723263ac46c8b6d49902ab08024b573fd2a416  blake3-1.5.4.tar.gz
+sha256  6b51aefe515969785da02e87befafc7fdc7a065cd3458cf1141f29267749e81f  blake3-1.8.2.tar.gz
 sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
 sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index f8ef2386f5..9d1323192c 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.5.4
+BLAKE3_VERSION = 1.8.2
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
