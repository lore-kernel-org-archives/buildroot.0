Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A9CC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48814188D;
	Sat, 23 Dec 2023 17:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C48814188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9wP3WtKqN7x; Sat, 23 Dec 2023 17:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9AC41840;
	Sat, 23 Dec 2023 17:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9AC41840
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF941BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5563641840
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5563641840
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWhCUqds9CYg for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DDAE41807
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDAE41807
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D1781600; Sat, 23 Dec 2023 17:46:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:43:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9c28434b2bc3f0bf87b17ab8733b6709861b093
X-Git-Newrev: 9dc526aa47f5ca73091504b596d629deb7c227d6
X-Patchwork-Hint: ignore
Message-Id: <20231223174633.67D1781600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.27.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9dc526aa47f5ca73091504b596d629deb7c227d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://cmake.org/cmake/help/v3.27/release/3.27.html#updates

Release notes:
https://www.kitware.com/cmake-3-27-8-available-for-download/
https://www.kitware.com/cmake-3-27-9-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index e495061bae..fbf0786232 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.7-SHA-256.txt
-sha256  08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e  cmake-3.27.7.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.9-SHA-256.txt
+sha256  609a9b98572a6a5ea477f912cffb973109ed4d0a6a6b3f9e2353d2cdc048708e  cmake-3.27.9.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 41278bf6db..7506e964a9 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).7
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
