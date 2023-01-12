Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE4C61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C01416E2;
	Thu, 12 Jan 2023 19:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C01416E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F43hsd6fOvNv; Thu, 12 Jan 2023 19:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7998B41764;
	Thu, 12 Jan 2023 19:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7998B41764
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B89C1BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 232A460E33
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 232A460E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scuMxb3qQ5Wa for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:26:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C8F160E67
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C8F160E67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C85D87A3C; Thu, 12 Jan 2023 19:26:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:24:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19eaece70a9c7aac8b26bd09c1a49b30e29f824a
X-Git-Newrev: bb066af7f9d84abf890c5692879477aaca36bff8
X-Patchwork-Hint: ignore
Message-Id: <20230112192614.3C85D87A3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigc: bump to version 3.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb066af7f9d84abf890c5692879477aaca36bff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.4.0/NEWS

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index 046584fc2b..a358732faa 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.2/libsigc++-3.2.0.sha256sum
-sha256  8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651  libsigc++-3.2.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.4/libsigc++-3.4.0.sha256sum
+sha256  02e2630ffb5ce93cd52c38423521dfe7063328863a6e96d41d765a6116b8707e  libsigc++-3.4.0.tar.xz
 
 # Locally calculated
 sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index eca4111ff6..2de49a0c1c 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 3.2
+LIBSIGC_VERSION_MAJOR = 3.4
 LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
@@ -13,6 +13,7 @@ LIBSIGC_LICENSE = LGPL-3.0+
 LIBSIGC_LICENSE_FILES = COPYING
 LIBSIGC_CONF_OPTS = \
 	-Dbuild-examples=false \
+	-Dbuild-tests=false \
 	-Dvalidation=false
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
