Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A691DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9CD610A4
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A9CD610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42A441593;
	Sat, 18 Sep 2021 17:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TrkOLnjR6pO; Sat, 18 Sep 2021 17:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD1F41582;
	Sat, 18 Sep 2021 17:55:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C011BF2F8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1432E41582
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lSd2G6A2P3b for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 17:55:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6AF1405FE
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 17:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2B94F8B680; Sat, 18 Sep 2021 17:53:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 19:55:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7c2eaf92949ea20bb0882c088f76b7becb95a64
X-Git-Newrev: c257ee17cf0c0fd4487fe69961c937d082b50541
X-Patchwork-Hint: ignore
Message-Id: <20210918175358.2B94F8B680@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.6.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=c257ee17cf0c0fd4487fe69961c937d082b50541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/a-j-wood/pv/releases/tag/v1.6.19
https://github.com/a-j-wood/pv/releases/tag/v1.6.20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../pv/0001-configure.in-tighten-AIX-test.patch    | 57 ----------------------
 package/pv/pv.hash                                 |  2 +-
 package/pv/pv.mk                                   |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)

diff --git a/package/pv/0001-configure.in-tighten-AIX-test.patch b/package/pv/0001-configure.in-tighten-AIX-test.patch
deleted file mode 100644
index 2e0d2af247..0000000000
--- a/package/pv/0001-configure.in-tighten-AIX-test.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From cd7605723eb8e6d8231644f1cf62f1e80badf074 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 20 Aug 2018 15:57:22 +0200
-Subject: [PATCH] configure.in: tighten AIX test
-
-Depending on the configuration, the cpp output may contain the string 'yes'
-in a comment if built under a path containing 'yes', confusing the _AIX
-test:
-
-${CROSS}-cpp conftest.h
-\# 1 "conftest.h"
-\# 1 "<built-in>"
-\# 1 "<command-line>"
-\# 31 "<command-line>"
-\# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h" 1 3 4
-\# 32 "<command-line>" 2
-\# 1 "conftest.txt"
-
-Fix it by only matching on 'yes' on a line by itself.
-
-Upstream-status: submitted to author
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
-
- autoconf/configure.in | 2 +-
- configure             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/autoconf/configure.in b/autoconf/configure.in
-index bd45004..487c42b 100644
---- a/autoconf/configure.in
-+++ b/autoconf/configure.in
-@@ -86,7 +86,7 @@ AC_PROG_MAKE_SET
- 
- dnl AIX needs -lc128
- dnl
--AC_EGREP_CPP([yes], [#ifdef _AIX
-+AC_EGREP_CPP([^yes$], [#ifdef _AIX
- yes
- #endif
- ], [LIBS="$LIBS -lc128"])
-diff --git a/configure b/configure
-index 7c11be0..59267b9 100755
---- a/configure
-+++ b/configure
-@@ -3377,7 +3377,7 @@ yes
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then
-+  $EGREP "^yes$" >/dev/null 2>&1; then
-   LIBS="$LIBS -lc128"
- fi
- rm -f conftest*
--- 
-2.11.0
-
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 1ce1191d54..b3dd71f74b 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1  pv-1.6.6.tar.bz2
+sha256  e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603  pv-1.6.20.tar.bz2
 
 # Hash for license file
 sha256  280e182171df3e9bb4a9b407326e88521151fcb8f4f8557255f26177d5900ccf  doc/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 122cc0c5ca..27060cf07e 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.6.6
+PV_VERSION = 1.6.20
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
