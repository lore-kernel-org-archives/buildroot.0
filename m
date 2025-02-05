Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B3EC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C671680EC2;
	Wed,  5 Feb 2025 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mg9LfM_OYVoy; Wed,  5 Feb 2025 21:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E0283A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E0283A45;
	Wed,  5 Feb 2025 21:54:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F30E1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECE4560690
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGgio4ioSli7 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D01FA60608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D01FA60608
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8017870DC; Wed,  5 Feb 2025 21:54:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 22:14:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03c498f1bc1ab9ee1ca305b9fce02a088e514a32
X-Git-Newrev: 267a6fe44f2dc9d1565566976d530e9d01756be1
X-Patchwork-Hint: ignore
Message-Id: <20250205215455.C8017870DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: bump to version
 20250127.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=267a6fe44f2dc9d1565566976d530e9d01756be1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 76f1bd0f32..701801a7c4 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3  libabseil-cpp-20240722.0.tar.gz
+sha256  16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8  libabseil-cpp-20250127.0.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index a27d013476..34d62c4dd1 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20240722.0
+LIBABSEIL_CPP_VERSION = 20250127.0
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
