Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F0C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12618841BA;
	Fri, 14 Oct 2022 14:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12618841BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCELBfTKFGtd; Fri, 14 Oct 2022 14:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162DD83F16;
	Fri, 14 Oct 2022 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162DD83F16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C18D1C11A0
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF19411AA
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBF19411AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6w3-WPYL-2ai for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 14:12:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35ED540629
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35ED540629
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2397186D0B; Fri, 14 Oct 2022 14:12:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 16:10:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c31f3b50f7c41f4e79b57a4ff4a1e430367bc63
X-Git-Newrev: 3ac7d91c874ae9212ae8aee400a194356e301169
X-Patchwork-Hint: ignore
Message-Id: <20221014141258.2397186D0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump to version 5.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ac7d91c874ae9212ae8aee400a194356e301169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://git.tukaani.org/?p=xz.git;a=blob;f=NEWS;h=0205423e79ce8297102096b0fc8b030ddf5b2023;hb=d24a57b7fc7e5e9267b84367cb0788d3acf7f569

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
