Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAB3C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCCF0841F6;
	Mon, 19 May 2025 10:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xd3n7w0VR00b; Mon, 19 May 2025 10:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A1E841F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A1E841F2;
	Mon, 19 May 2025 10:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18D2A193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6FBC4191E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eXNLWxeKLdl for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1962E4187D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1962E4187D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16E5E872E7; Mon, 19 May 2025 10:40:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:46:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32df543fa3c61c922296d79b9304d6cb730f93b2
X-Git-Newrev: 973a952750c5f5f01e9a12745e5e57c988fcaba0
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.16E5E872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jpeg-turbo: bump to
 version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=973a952750c5f5f01e9a12745e5e57c988fcaba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate from old sourceforge download location to github.

License hash changed due to year update:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/a927b489e22dffa309f3f617005c0cebaf8fc00c

Readme hash changed due to various minor tweaks:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/94c64ead85b4af254df089f16c10253598b0705e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 9 +++------
 package/jpeg-turbo/jpeg-turbo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index a929ae4dcb..821e78438b 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.5/
-sha1  edab071e7c5bc12f98a2a7ae499bd6b312770849  libjpeg-turbo-2.1.5.tar.gz
-md5  1c6e9f8550a82c6d4cd30b370c22a5fd  libjpeg-turbo-2.1.5.tar.gz
 # Locally computed
-sha256  bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf  libjpeg-turbo-2.1.5.tar.gz
-sha256  60c756742db3ad1913304e8b13f0e86e22e51adb50cc0b3333c163f7e45ceec1  LICENSE.md
-sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
+sha256  9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93  libjpeg-turbo-3.1.0.tar.gz
+sha256  96f5b328adbb78eeaaec6980d73fd558cb1e4d62560ed615646bc3cf5e532430  LICENSE.md
+sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 5e806156e8..df76e4d92a 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.5
+JPEG_TURBO_VERSION = 3.1.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
-JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
+JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md README.ijg
 JPEG_TURBO_CPE_ID_VENDOR = libjpeg-turbo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
