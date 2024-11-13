Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37804D597B0
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B7F4059B;
	Wed, 13 Nov 2024 16:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTg6xOTXAZG3; Wed, 13 Nov 2024 16:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12ABC405B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12ABC405B4;
	Wed, 13 Nov 2024 16:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A45E1531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 487D56086B
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXWYpuAMOSLl for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE5960659
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE5960659
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 269D88630A; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 17:10:39 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 3382f699e7ce4f2ffbd65a61b45eb5a99f7deb90
X-Git-Newrev: 3c94589006b9a3bb48ea959d242aac6bf9e42d6c
X-Patchwork-Hint: ignore
Message-Id: <20241113164856.269D88630A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/cmake: bump to
 3.30.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c94589006b9a3bb48ea959d242aac6bf9e42d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

This is minor release. According to
https://cmake.org/cmake/help/latest/release/3.30.html#updates:

3.30.1, 3.30.2

These versions made no changes to documented features or
interfaces. Some implementation updates were made to support ecosystem
changes and/or fix regressions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e9261d9b6388dc382e59f44174f1806d326ad15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index ee6dab551c..1a59c3fe89 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.30/cmake-3.30.0-SHA-256.txt
-sha256  157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579  cmake-3.30.0.tar.gz
+# From https://cmake.org/files/v3.30/cmake-3.30.2-SHA-256.txt
+sha256  46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2  cmake-3.30.2.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 842457eb34..e7d2d86791 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.30
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
