Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBC5C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD12613A3;
	Mon,  4 Aug 2025 20:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaYJTQwOUrL7; Mon,  4 Aug 2025 20:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C91613A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C91613A4;
	Mon,  4 Aug 2025 20:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9282F1A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7927840D63
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jQDMJ_6JpNX for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3F840D64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA3F840D64
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5A7986E7E; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Aug 2025 22:10:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd389351772c6acd483a84e54def4f3ae3eaa248
X-Git-Newrev: 2e4be3a5be263d01d92edc02004d4ce138cba696
X-Patchwork-Hint: ignore
Message-Id: <20250804201258.B5A7986E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmspack: bump version to
 0.11alpha
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e4be3a5be263d01d92edc02004d4ce138cba696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmspack/libmspack.hash | 2 +-
 package/libmspack/libmspack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmspack/libmspack.hash b/package/libmspack/libmspack.hash
index 9e97063f01..a4fcb61bef 100644
--- a/package/libmspack/libmspack.hash
+++ b/package/libmspack/libmspack.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bac862dee6e0fc10d92c70212441d9f8ad9b0222edc9a708c3ead4adb1b24a8e  libmspack-0.10.1alpha.tar.gz
+sha256  70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b  libmspack-0.11alpha.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING.LIB
diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
index f806192eec..2f64e992fb 100644
--- a/package/libmspack/libmspack.mk
+++ b/package/libmspack/libmspack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMSPACK_VERSION_MAJOR = 0.10.1
+LIBMSPACK_VERSION_MAJOR = 0.11
 LIBMSPACK_VERSION_MINOR = alpha
 LIBMSPACK_VERSION = $(LIBMSPACK_VERSION_MAJOR)$(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_SITE = https://www.cabextract.org.uk/libmspack
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
