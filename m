Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE3C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B77A4357B;
	Fri, 29 Dec 2023 21:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B77A4357B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJsUrMwJQy8V; Fri, 29 Dec 2023 21:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58DB64359D;
	Fri, 29 Dec 2023 21:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58DB64359D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 019C31BF997
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F7B94009B
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7B94009B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5Wely_43rJe for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0936C4006B
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0936C4006B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3A8838BD; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:56:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5338da0771a119a16e105f168affa7d0d902b97d
X-Git-Newrev: 90c3ed83164deaece8b136d98ce0d82954f892c5
X-Patchwork-Hint: ignore
Message-Id: <20231229211748.EE3A8838BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgicc: bump to version 3.2.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=90c3ed83164deaece8b136d98ce0d82954f892c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcgicc/libcgicc.hash | 2 +-
 package/libcgicc/libcgicc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
index 87540c8144..699a0dbfd4 100644
--- a/package/libcgicc/libcgicc.hash
+++ b/package/libcgicc/libcgicc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0  cgicc-3.2.19.tar.gz
+sha256  0f91c5ce8adf406ad35a46152ffb2b9c8d6079604b796d81f48b66d1f068ad4e  cgicc-3.2.20.tar.gz
 
 # Hash for license files:
 sha256  a2e480f5e8afd7c587a3c0ac2ed3b73ed4b10fa3a553dea26e7b661c7cedda72  COPYING.LIB
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index e9ce4043f5..3d651aefc0 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.19
+LIBCGICC_VERSION = 3.2.20
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPL-3.0+ (library), GFDL-1.2+ (docs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
