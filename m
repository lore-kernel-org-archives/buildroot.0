Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D944FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F7D610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91F7D610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB1B842BB;
	Wed,  4 Aug 2021 00:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khODnPlyEQzh; Wed,  4 Aug 2021 00:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40470842BE;
	Wed,  4 Aug 2021 00:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 464301BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75CA40E4D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OYEvoM_dEts for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D0294063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A74D887B09; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 22:25:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99c797ad8908bd831acb9aa7d6690f30bf3a8677
X-Git-Newrev: 9265f1e8ac21bf867edb22710e4602192e479c84
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.A74D887B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/opkg-utils: bump to
 version 0.4.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9265f1e8ac21bf867edb22710e4602192e479c84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch URL to HTTPS address for git repository.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...efile-seperate-manpages-and-utils-install.patch | 50 ----------------------
 package/opkg-utils/opkg-utils.hash                 |  2 +-
 package/opkg-utils/opkg-utils.mk                   |  4 +-
 3 files changed, 3 insertions(+), 53 deletions(-)

diff --git a/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch b/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
deleted file mode 100644
index 140187ca3a..0000000000
--- a/package/opkg-utils/0001-Makefile-seperate-manpages-and-utils-install.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 74ccbee0f798822041dba5c6564df62a0c60d86b Mon Sep 17 00:00:00 2001
-From: Ryan Barnett <ryanbarnett3@gmail.com>
-Date: Mon, 22 Feb 2021 07:09:34 -0600
-Subject: Makefile: separate manpages and utils install
-
-The installation of opkg-build man page introduces a host dependency
-on perl for the pod2man package to generate the man page.
-
-To allow the opkg-utils scripts to be installed separately from the
-manpages, break apart the install step into two install steps:
-install-utils and install-docs
-
-Backported from: 74ccbee0f798822041dba5c6564df62a0c60d86b
-
-CC: Christian Hermann <mail@hermannch.dev>
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
-Signed-off-by: Alex Stewart <alex.stewart@ni.com>
-Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
----
- Makefile | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4049654..fe96d5a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -27,9 +27,11 @@ mandir ?= $(PREFIX)/man
- 
- all: $(UTILS) $(MANPAGES)
- 
--install: all
-+install-utils: $(UTILS)
- 	install -d $(DESTDIR)$(bindir)
- 	install -m 755 $(UTILS) $(DESTDIR)$(bindir)
-+
-+install-docs: $(MANPAGES)
- 	install -d $(DESTDIR)$(mandir)
- 	for m in $(MANPAGES); \
- 	do \
-@@ -37,4 +39,6 @@ install: all
- 		install -m 644 "$$m" $(DESTDIR)$(mandir)/man$${m##*.}; \
- 	done
- 
--.PHONY: install all
-+install: install-utils install-docs
-+
-+.PHONY: install install-utils install-docs all
--- 
-cgit v1.2.2-1-g5e49
-
diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 779852d9c0..29671f9609 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  552c074630b6d6b39a32a35243fb34d7c5888b8a4f18118abb4daf92d0e847f2  opkg-utils-0.4.3-br1.tar.gz
+sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index cdffd6f1c4..369a4586e8 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.4.3
-OPKG_UTILS_SITE = http://git.yoctoproject.org/git/opkg-utils
+OPKG_UTILS_VERSION = 0.4.5
+OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
