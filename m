Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F88C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32DE180D69;
	Sat,  8 Jan 2022 10:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4EBhgSaFUhn; Sat,  8 Jan 2022 10:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA4D80AC8;
	Sat,  8 Jan 2022 10:41:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEC31BF306
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BA9760B0A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzeelqM_EChh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:41:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B0F460803
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:41:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56A41811B7; Sat,  8 Jan 2022 10:35:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 11:39:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5483ea9e972d8c18d63561cae5639b4510f2bb93
X-Git-Newrev: 24999e2025fb53b237b4f8f79244e45b0b366ca0
X-Patchwork-Hint: ignore
Message-Id: <20220108103510.56A41811B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: bump version to 2.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=24999e2025fb53b237b4f8f79244e45b0b366ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash and location of LICENSE.TXT due to upstream commit:
https://gitlab.freedesktop.org/freetype/freetype/-/commit/0606350c2a08eec120e4557a07f252e1c72963ce

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 36571b51af..7abc3d96da 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/
-sha1  0181862673f7216ad2b5074f95fc131209e30b27  freetype-2.10.4.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.11.1/
+sha1  86bdc98b37efe447cf53420bf2c18402ff905112  freetype-2.11.1.tar.xz
 
 # Locally calculated
-sha256  86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784  freetype-2.10.4.tar.xz
-sha256  fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  docs/LICENSE.TXT
+sha256  3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8  freetype-2.11.1.tar.xz
+sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 59d6dc0eb8..912e6c4daa 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.10.4
+FREETYPE_VERSION = 2.11.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPL-2.0+
-FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
+FREETYPE_LICENSE_FILES = LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
