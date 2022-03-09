Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819B5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A474168B;
	Wed,  9 Mar 2022 20:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7StJ51VeVFlZ; Wed,  9 Mar 2022 20:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2481410E7;
	Wed,  9 Mar 2022 20:28:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7A21BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7F760F18
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKHUEuMDmXFd for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8870760AA3
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54A078394B; Wed,  9 Mar 2022 20:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:26:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f73e257cdf859c67ed2c3769f9ef15dc8f9b4878
X-Git-Newrev: b335ba17be6139a1fa2f6e58c3d87f89d98c0ed8
X-Patchwork-Hint: ignore
Message-Id: <20220309201939.54A078394B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faketime: bump to version 0.9.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b335ba17be6139a1fa2f6e58c3d87f89d98c0ed8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/wolfcw/libfaketime/releases/tag/v0.9.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faketime/faketime.hash | 2 +-
 package/faketime/faketime.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index 0628ff9ae6..a7d8d62dba 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57d0181150361c0a9b5c8eef05b11392f6134ada2c2d998e92e63daed639647c  faketime-0.9.9.tar.gz
+sha256  729ad33b9c750a50d9c68e97b90499680a74afd1568d859c574c0fe56fe7947f  faketime-0.9.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 355477ba3b..6fc684f852 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = 0.9.9
+FAKETIME_VERSION = 0.9.10
 FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
