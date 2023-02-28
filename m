Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5258CC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC69C60AD4;
	Tue, 28 Feb 2023 15:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC69C60AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Hs2ixWySkz7; Tue, 28 Feb 2023 15:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 140C66117B;
	Tue, 28 Feb 2023 15:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 140C66117B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9AC1BF2AA
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1751F60E46
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1751F60E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJK03ToeCo1m for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38780600CC
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38780600CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2517286D0B; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:47:13 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f176b6fa3708fd27740a69d6c31411439c2be08d
X-Git-Newrev: 36f98b644c7d7376fdb6f3815f284cf8fff9ea14
X-Patchwork-Hint: ignore
Message-Id: <20230228155909.2517286D0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xz: bump to
 version 5.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=36f98b644c7d7376fdb6f3815f284cf8fff9ea14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Drop patch (already in version)

https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;h=0205423e79ce8297102096b0fc8b030ddf5b2023;hb=d24a57b7fc7e5e9267b84367cb0788d3acf7f569

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ac7d91c874ae9212ae8aee400a194356e301169)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash | 3 +--
 package/xz/xz.mk   | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 9577e98e80..3aa68791fd 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,6 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df  xz-5.2.5.tar.bz2
-sha256  98c6cb1042284fe704ec30083f3fc87364ce9ed2ea51f62bbb0ee9d3448717ec  xzgrep-ZDI-CAN-16587.patch
+sha256  b65f1d0c2708e57716f4dd2216989a73847ac6fdb4168ffceb155767e22b834b  xz-5.2.7.tar.bz2
 
 # Hash for license files
 sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index cdb01e06a9..004eea94b2 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.5
+XZ_VERSION = 5.2.7
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
@@ -13,10 +13,6 @@ XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
-XZ_PATCH = xzgrep-ZDI-CAN-16587.patch
-# xzgrep-ZDI-CAN-16587.patch
-XZ_IGNORE_CVES += CVE-2022-1271
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 XZ_CONF_OPTS += --enable-threads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
