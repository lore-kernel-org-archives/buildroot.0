Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9AC87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B098D6137E;
	Mon,  4 Aug 2025 20:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0R7reyS1wtCT; Mon,  4 Aug 2025 20:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92C360AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92C360AF2;
	Mon,  4 Aug 2025 20:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5141A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6155040D69
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XQE1uwYxBxB for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B17C640D2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B17C640D2B
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6D8B86E9E; Mon,  4 Aug 2025 20:12:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Aug 2025 22:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b607a774403f7cbdfd968a80ec1c5bcf7eff524
X-Git-Newrev: fd389351772c6acd483a84e54def4f3ae3eaa248
X-Patchwork-Hint: ignore
Message-Id: <20250804201258.A6D8B86E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: bump version to 1.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd389351772c6acd483a84e54def4f3ae3eaa248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ebiggers/libdeflate/blob/v1.24/NEWS.md

Switch _SITE to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdeflate/libdeflate.hash | 2 +-
 package/libdeflate/libdeflate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index bb97c76c3d..231548feed 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6  libdeflate-1.22.tar.gz
+sha256  a0dda1c4b804742066db07b9510876edd09cc0ca06cdc32c5dfe1b2016a26463  libdeflate-1.24.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 823ff442fd..08c94f9250 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.22
-LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
+LIBDEFLATE_VERSION = 1.24
+LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
 LIBDEFLATE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
