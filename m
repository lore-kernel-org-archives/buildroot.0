Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E22C4725D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 10:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5875281E19;
	Mon, 22 Jan 2024 10:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5875281E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D-KpFH0fiK5; Mon, 22 Jan 2024 10:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A768881CE3;
	Mon, 22 Jan 2024 10:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A768881CE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5431BF834
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 10:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 043FE81E16
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 10:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043FE81E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHQjKRqv9XUV for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 10:15:13 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E41581D02
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 10:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E41581D02
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 27AF73520F04; Mon, 22 Jan 2024 11:15:10 +0100 (CET)
Date: Mon, 22 Jan 2024 11:15:09 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Za5ALVSKp4U3Pa2Z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1705918510; bh=c6+/onjOmEo8SBt4xmEPFmp+2pxiPRdL6rdgzyuQ9Cg=;
 h=Date:From:To:Subject:From;
 b=MpXqEhkebAvUJwPUsO4JkNH9c6APv8G+xfilHUHXqEvdUGVm0T6sWfG56HNVUjX3d
 0cHV5G1Qgq36rsbFH0NhiNxEMhDpOfzmAsr9UhyoQRl35kIzx29t/y4OhBRkgv7JcL
 g0y41muKMUVJkoP6jjWLEyTGbv/Z/oiqwRhhpdfFrumpVMN54wrNHxUcuJO2j0P5Ea
 P3dzrXKT59yWr7+wKI+e8P6jfV9f/rVYT3Iu6g+/WeZs+phvWN0Hl7ZLfiFsbxXmne
 6XAPl7bgH/0PnRigL6rR2LKiSzhxbZfX90Xv84ccR4UQ0dDSsHxRVbMLUE+S5tVyU3
 R7jk91YnnjEeQ==
Subject: [Buildroot] [PATCH] package/ruby: bump to 3.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changes:
https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/

Patch applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  1 -
 .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 -------------------
 package/ruby/ruby.hash                        |  4 +--
 package/ruby/ruby.mk                          |  6 ++---
 4 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 914dd6fb63..0b57df65b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1188,7 +1188,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
 package/rubix/0001-dont-use-legacy-functions.patch Upstream
 package/rubix/0002-misc-fixes.patch Sob Upstream
-package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch Upstream
 package/rygel/0001-build-Add-man_pages-build-options.patch Upstream
 package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch Upstream
 package/rygel/S99rygel Indent Shellcheck Variables
diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
deleted file mode 100644
index 805dfd2f89..0000000000
--- a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
-From: Jeremy Evans <code@jeremyevans.net>
-Date: Fri, 25 Mar 2022 13:11:31 -0700
-Subject: [PATCH] Fix build with LibreSSL 3.5
-
-[Retrieved from:
-https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ext/openssl/ossl_pkey.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
-index 2a4835a2..24d0da46 100644
---- a/ext/openssl/ossl_pkey.c
-+++ b/ext/openssl/ossl_pkey.c
-@@ -710,7 +710,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
- 	}
-     }
-     else {
--#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
-+#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
- 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
- 						  ossl_pem_passwd_cb,
- 						  (void *)pass)) {
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 42d8a2497f..a05aa79bd7 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/
-sha512  4b0fd334ae56132ba98b8a69adad54bdcf7f7aeabd5eba5b0f0399a3868e2054f9026ca1b1cb2dbb197a9e9b0610b263481949c0623a62071546bc5adff8ca69  ruby-3.1.3.tar.xz
+# https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
+sha512  7959c5753bfa0bfc4d6d74060869aabbe9815c1c97930659da11b917ee0803ddbbd80e869e00c48b8694b4ba48709c3b6493fd045568e36e902616c35ababf01  ruby-3.3.0.tar.xz
 
 # License files, Locally calculated
 sha256  794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 28b1ec13ef..b2396010c5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
-RUBY_VERSION_EXT = 3.1.0
+RUBY_VERSION_MAJOR = 3.3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
