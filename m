Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538C9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9A161452
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA9A161452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EC7415B2;
	Wed, 29 Sep 2021 14:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCKL-he_JQZ0; Wed, 29 Sep 2021 14:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D51A424F8;
	Wed, 29 Sep 2021 14:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8AA91BF9B4
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9265832DC
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9liZdKdZLvU for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 14:55:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE65180DD3
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 14:55:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 095F38D48F; Wed, 29 Sep 2021 14:53:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:54:15 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e0baa69b7e601628ae34f10ae89256c70c787ab8
X-Git-Newrev: ffa393b32e609197024b8ccd52644a6b931bce6f
X-Patchwork-Hint: ignore
Message-Id: <20210929145300.095F38D48F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/imlib2: bump
 version to 1.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffa393b32e609197024b8ccd52644a6b931bce6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4b897e778a487fb8693d8595009d6c2c4692dd99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imlib2/imlib2.hash | 8 ++++----
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 3df3deffec..690d836c2e 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.1/
-md5  98569de9b10bcb6fd5d13e4d331ddd81  imlib2-1.7.1.tar.bz2
-sha1  092c66ae0180798a4036e68c68d7f316de192e36  imlib2-1.7.1.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.3/
+md5  1e79055a0b8fe27d208b6f8bb1bde60c  imlib2-1.7.3.tar.bz2
+sha1  3d55965f946d0b2754a84c8e57c78ddc227252c6  imlib2-1.7.3.tar.bz2
 
 # Locally computed
-sha256  033a6a639dcbc8e03f65ff05e57068e7346d50ee2f2fff304bb9095a1b2bc407  imlib2-1.7.1.tar.bz2
+sha256  158d0b8c20bc11221af9e77a64a116fca7051b03cdea2c4f31d31f469382f997  imlib2-1.7.3.tar.bz2
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 6d973827dc..89b4769f92 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.7.1
+IMLIB2_VERSION = 1.7.3
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
