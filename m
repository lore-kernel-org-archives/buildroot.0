Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA68E6120E
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA68E6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B4168247F;
	Fri, 10 Sep 2021 21:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs4EKYydWZsY; Fri, 10 Sep 2021 21:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1CA818A7;
	Fri, 10 Sep 2021 21:34:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7C11BF9C8
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D874028B
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48u_8U3kXWfo for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F2540288
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F02AD88EAB; Fri, 10 Sep 2021 21:32:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:59:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde22d8c7750324ab97c2bea6d1e8adad9c04251
X-Git-Newrev: 088cf29f135d05cb07ed3c4870e1c38d2c7a5f53
X-Patchwork-Hint: ignore
Message-Id: <20210910213230.F02AD88EAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: bump version to
 0.6.1
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
Content-Type: multipart/mixed; boundary="===============5162485538248302453=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============5162485538248302453==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=088cf29f135d05cb07ed3c4870e1c38d2c7a5f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bayer2rgb-neon/bayer2rgb-neon.hash | 2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
index b1e87d7a36..26a14fcb51 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.hash
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d2e3e97bb9da218f223c03b2f080c5da727224e6e4cb99979398971110dfae04  bayer2rgb-neon-bef3ecafe290d61a50fd27da3e5d0df6f4b88045-br1.tar.gz
+sha256  edf451dbb52ad67eb35f9043390bd75ea7228d493c99184aae80b3bd27beab62  bayer2rgb-neon-15feb1115b4828488cc36d09f625e23e8b6a0ec5-br1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
index 34510e7616..a483890c81 100644
--- a/package/bayer2rgb-neon/bayer2rgb-neon.mk
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAYER2RGB_NEON_VERSION = bef3ecafe290d61a50fd27da3e5d0df6f4b88045
+BAYER2RGB_NEON_VERSION = 15feb1115b4828488cc36d09f625e23e8b6a0ec5
 BAYER2RGB_NEON_SITE = https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb.git
 BAYER2RGB_NEON_SITE_METHOD = git
 BAYER2RGB_NEON_LICENSE = GPL-3.0

--===============5162485538248302453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5162485538248302453==--
