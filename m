Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AA5EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A736060A;
	Fri, 14 Jul 2023 10:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9A736060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rM_6dV9PBV9r; Fri, 14 Jul 2023 10:26:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988F56142A;
	Fri, 14 Jul 2023 10:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988F56142A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 311DD1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9166C417E1
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9166C417E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f814O-DNJbrn for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F344173B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F344173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62E4387086; Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:23:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9fa704025d025433651223fea5e8b1983520187
X-Git-Newrev: 4528d5093c9a0002be6787024a342979666ce9af
X-Patchwork-Hint: ignore
Message-Id: <20230714102624.62E4387086@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: bump version to 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4528d5093c9a0002be6787024a342979666ce9af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hashes due to upstream commit:
"Sync GPL/LGPL license files from Gnulib"
https://github.com/gnutls/gnutls/commit/a39e528897184c6f6a33d245b82891a8dc8090ce

Removed configure options related to guile which were removed upstream:
https://github.com/gnutls/gnutls/commit/100cc2a706b8e097cbeb63d08c7ea59717c906ca

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.hash | 8 ++++----
 package/gnutls/gnutls.mk   | 6 ++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 303f1351e0..2f6dba9d3c 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.8.tar.xz.sig
-sha256  c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114  gnutls-3.7.8.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.0.tar.xz.sig
+sha256  0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5  gnutls-3.8.0.tar.xz
 # Locally calculated
-sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6e2cc501ef..d6b8b229bd 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
-GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
+GNUTLS_VERSION_MAJOR = 3.8
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).0
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
@@ -16,7 +16,6 @@ GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 libunistring nettle
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
-	--disable-guile \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
@@ -44,7 +43,6 @@ GNUTLS_INSTALL_STAGING = YES
 HOST_GNUTLS_DEPENDENCIES = host-pkgconf host-libtasn1 host-libunistring host-nettle
 HOST_GNUTLS_CONF_OPTS = \
 	--disable-doc \
-	--disable-guile \
 	--disable-libdane \
 	--disable-rpath \
 	--disable-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
