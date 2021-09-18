Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB870C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DE96127B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67DE96127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A07841A7;
	Sat, 18 Sep 2021 15:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s--EAdGQYK8g; Sat, 18 Sep 2021 15:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A0784191;
	Sat, 18 Sep 2021 15:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 028201BF95D
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5686841A4
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExR_spXcUgJF for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:30:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A76D81751
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BDB2A88EAA; Sat, 18 Sep 2021 15:28:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 17:28:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6977ee6e0ecf9cc9b24e5f41f9598f22fd0fcaf3
X-Git-Newrev: 48bce9328582d553d25bbaa77c169eb86840bde7
X-Patchwork-Hint: ignore
Message-Id: <20210918152822.BDB2A88EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqmi: bump version to 1.30.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48bce9328582d553d25bbaa77c169eb86840bde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-build-meson-fix-introspection-option.patch | 33 ----------------------
 package/libqmi/libqmi.hash                         |  2 +-
 package/libqmi/libqmi.mk                           |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/libqmi/0001-build-meson-fix-introspection-option.patch b/package/libqmi/0001-build-meson-fix-introspection-option.patch
deleted file mode 100644
index 0528868025..0000000000
--- a/package/libqmi/0001-build-meson-fix-introspection-option.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bfb066419f288764edbade1e27e93a5dda59a5f4 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Fri, 6 Aug 2021 10:32:22 +0200
-Subject: [PATCH] build,meson: fix introspection option
-
-Using -Dintrospection=false would actually not disable it. There is no
-longer an "auto" option for the introspection support, it will be
-either enabled or disabled depending on what the user asks
-for (default enabled).
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b25bca57..d28e5601 100644
---- a/meson.build
-+++ b/meson.build
-@@ -218,7 +218,10 @@ version_conf.set10('QMI_QRTR_SUPPORTED', enable_qrtr)
- version_conf.set10('QMI_RMNET_SUPPORTED', enable_rmnet)
-
- # introspection support
--enable_gir = dependency('gobject-introspection-1.0', version: '>= 0.9.6', required: get_option('introspection')).found()
-+enable_gir = get_option('introspection')
-+if enable_gir
-+  dependency('gobject-introspection-1.0', version: '>= 0.9.6')
-+endif
-
- random_number = qmi_minor_version + meson.version().split('.').get(1).to_int()
-
---
-2.17.0
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 0373bb4e75..1f2da45ac0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  c0421684c12697c448077dd5c0a66c6f745deab3558af578e3f10307c8a0c564  libqmi-1.30.0.tar.gz
+sha256  2eb7c7971b91a64ad830643b0170cff692a69bf0f093ca61d72d3f466a0272d4  libqmi-1.30.2.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 05fd3ae9af..cd2c2719f9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.0
+LIBQMI_VERSION = 1.30.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
