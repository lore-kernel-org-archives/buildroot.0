Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD67C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C180640901;
	Tue, 11 Jan 2022 21:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR7Qfuxvvypx; Tue, 11 Jan 2022 21:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B75408FE;
	Tue, 11 Jan 2022 21:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3961BF9AC
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C15683E64
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWT03DOijLmL for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:15:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B116783E3A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DF41F834DC; Tue, 11 Jan 2022 21:09:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:15:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8dc871139f83c8b4a0cdcdaf2ded18ee463d65f
X-Git-Newrev: ead58eaad3cab6593356a1a254fac1eb15f8ef7c
X-Patchwork-Hint: ignore
Message-Id: <20220111210902.DF41F834DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: bump version to
 7.1.0-19
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

commit: https://git.buildroot.net/buildroot/commit/?id=ead58eaad3cab6593356a1a254fac1eb15f8ef7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://github.com/ImageMagick/ImageMagick/blob/main/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index b787643fde..278becd2ab 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc454be622724c6224fa6c8230bb9c50191a05fbf05b9c9c25aa3e5497090b83  imagemagick-7.0.11-13.tar.gz
+sha256  385ca5bd8ce9b37e685779c46868171af949265c9db40067c1c4d7442dbc723e  imagemagick-7.1.0-19.tar.gz
 sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index a6eaf99887..64a530c6d2 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.11-13
+IMAGEMAGICK_VERSION = 7.1.0-19
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
