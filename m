Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38710C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF5D08349A;
	Mon, 14 Mar 2022 09:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQYvBTZjOCj2; Mon, 14 Mar 2022 09:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3070A83381;
	Mon, 14 Mar 2022 09:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1192F1BF3CA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34F840147
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 09:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAOkxxIrkzHP for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 09:20:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5FFD40184
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 09:20:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2F29783D60; Mon, 14 Mar 2022 09:11:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 10:16:23 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a717432b35e304d345df2cedd36da67d5f6514ad
X-Git-Newrev: c5bbfe01c0238f998ee4ffdf46588a251db694d4
X-Patchwork-Hint: ignore
Message-Id: <20220314091155.2F29783D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gnutls: security
 bump to version 3.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5bbfe01c0238f998ee4ffdf46588a251db694d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

see https://www.gnutls.org/security-new.html#GNUTLS-SA-2022-01-17

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 212b020bb43f13121d6cde464f871d5d1cf6cfbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 5d4fd1a0dc..2ffc6c1b4e 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz.sig
-sha256  646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752  gnutls-3.7.2.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.3.tar.xz.sig
+sha256  fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a  gnutls-3.7.3.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index be5af1933e..49a8f49cd1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
