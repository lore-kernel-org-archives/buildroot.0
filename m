Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D05C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 886CA405D7;
	Fri, 28 Jan 2022 20:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A01SZPJL6zhM; Fri, 28 Jan 2022 20:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8651940253;
	Fri, 28 Jan 2022 20:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADB51BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2387041518
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSqCwAWBEfmP for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB974154B
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:46:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A95DA82B52; Fri, 28 Jan 2022 20:39:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:41:10 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: c0dab0bd0be3018facc25bcc9227926af59fd0c1
X-Git-Newrev: a9c73096689ea5a5b3bf2b5e020d9e1e77189056
X-Patchwork-Hint: ignore
Message-Id: <20220128203949.A95DA82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libpjsip:
 security bump to version 2.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9c73096689ea5a5b3bf2b5e020d9e1e77189056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Security update. This version is recommended for all users to improve
the security of applications using PJSIP.

Fix CVE-2020-15260, CVE-2021-21375 and CVE-2021-32686

Update indentation in hash file (two spaces)

https://github.com/pjsip/pjproject/security/advisories/GHSA-8hcp-hm38-mfph
https://github.com/pjsip/pjproject/security/advisories/GHSA-hvq6-f89p-frvp
https://github.com/pjsip/pjproject/security/advisories/GHSA-cv8x-p47p-99wr
https://github.com/pjsip/pjproject/releases/tag/2.11
https://github.com/pjsip/pjproject/releases/tag/2.11.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2c7ad667ec4a25226848baba809e492ca0ff06da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 4 ++--
 package/libpjsip/libpjsip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 68c2208885..f39ebf4060 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	936a4c5b98601b52325463a397ddf11ab4106c6a7b04f8dc7cdd377efbb597de	pjproject-2.10.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  45f6604372df3f49293749cd7c0b42cb21c4fb666c66f8ed9765de004d1eae38  pjproject-2.11.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8feec9bcb2..0a93780e93 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.10
+LIBPJSIP_VERSION = 2.11.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
-# https://github.com/pjsip/pjproject/archive/2.10.tar.gz
+# https://github.com/pjsip/pjproject/archive/2.11.1.tar.gz
 
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
