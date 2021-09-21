Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B054C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58D761050
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C58D761050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992C06138B;
	Tue, 21 Sep 2021 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwUUfMrYMRGb; Tue, 21 Sep 2021 19:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E724F60898;
	Tue, 21 Sep 2021 19:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45BF61BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F73C400CF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTFPum9qm0wH for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28203403F9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B8598C10A; Tue, 21 Sep 2021 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 21:20:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 791938d1dcde4a4e32b301ad6aa484dc82b41a68
X-Git-Newrev: bdd05a2b1323b4bdfbcaf559e0567a7d09f4837d
X-Patchwork-Hint: ignore
Message-Id: <20210921192443.5B8598C10A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: bump to version 2.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdd05a2b1323b4bdfbcaf559e0567a7d09f4837d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYRIGHT (update in year:
  https://github.com/cjlin1/liblinear/commit/65115f742683b21ed10582c1664829e0146fcaec
  https://github.com/cjlin1/liblinear/commit/acf2f9caf166574a23912fe0e57e16187f74f5a6)
- Refresh second patch
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liblinear/0002-build-static-lib.patch | 12 +++++++-----
 package/liblinear/liblinear.hash              |  4 ++--
 package/liblinear/liblinear.mk                |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0002-build-static-lib.patch
index 98657d3c82..f3497b767e 100644
--- a/package/liblinear/0002-build-static-lib.patch
+++ b/package/liblinear/0002-build-static-lib.patch
@@ -1,18 +1,20 @@
 Makefile: add a rule to build a static library
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Fabrice: update for 2.43]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
 --- liblinear-1.96.orig/Makefile	2014-11-15 07:50:23.000000000 +0100
 +++ liblinear-1.96/Makefile	2014-12-14 00:23:00.135893956 +0100
 @@ -16,6 +16,11 @@
  	fi; \
- 	$(CXX) $${SHARED_LIB_FLAG} linear.o tron.o blas/blas.a -o liblinear.so.$(SHVER)
+ 	$(CXX) $${SHARED_LIB_FLAG} linear.o newton.o blas/blas.a -o liblinear.so.$(SHVER)
  
 +# Keeping blas/blas.a as a pre-requisite, to ensure all .o files are built
-+static-lib: linear.o tron.o blas/blas.a
-+	$(AR) rcv liblinear.a linear.o tron.o blas/*.o
++static-lib: linear.o newton.o blas/blas.a
++	$(AR) rcv liblinear.a linear.o newton.o blas/*.o
 +	$(RANLIB) liblinear.a
 +
- train: tron.o linear.o train.c blas/blas.a
- 	$(CXX) $(CFLAGS) -o train train.c tron.o linear.o $(LIBS)
+ train: newton.o linear.o train.c blas/blas.a
+ 	$(CXX) $(CFLAGS) -o train train.c newton.o linear.o $(LIBS)
  
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 4430d29989..a714b8bc4e 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac liblinear-2.30.tar.gz
-sha256 c366abf1cb3a003d8c6e6d9c111a23c432db1d001294f88d479b70b60d7c0af2 COPYRIGHT
+sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
+sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 2d0fd0013c..3b137ed518 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.30
+LIBLINEAR_VERSION = 2.43
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
