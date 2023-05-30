Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A07C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C8E41B7F;
	Tue, 30 May 2023 19:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C8E41B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiaEkEsgjKy0; Tue, 30 May 2023 19:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B208640992;
	Tue, 30 May 2023 19:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B208640992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A20C41BF966
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 875B181FC4
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875B181FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmP94XocNjnk for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5065D81FB8
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5065D81FB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF6186AC1; Tue, 30 May 2023 19:54:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:50:50 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 387d2d12f33939d9eb86f7abe849110b63dfc703
X-Git-Newrev: 83e422c4ae870cb69adeef99a783ba214228860c
X-Patchwork-Hint: ignore
Message-Id: <20230530195443.3BF6186AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gnupg2: bump
 version to 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=83e422c4ae870cb69adeef99a783ba214228860c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

For details see [1].

[1] https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a27cb09d9aaa4f6f1056c520f8d0c48912451734)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index c642862fe2..baee824104 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
-sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html
+sha1  d7d021101361a5e1166a6c0cc1731276e7134547  gnupg-2.4.1.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.1.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
+sha256  76b71e5aeb443bfd910ce9cbc8281b617c8341687afb67bae455877972b59de8  gnupg-2.4.1.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 73de185ba7..f7c7ae847c 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.0
+GNUPG2_VERSION = 2.4.1
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
