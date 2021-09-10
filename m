Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEA7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86EF6120E
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E86EF6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D69605CC;
	Fri, 10 Sep 2021 21:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2X09k9yw-8R; Fri, 10 Sep 2021 21:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052956067D;
	Fri, 10 Sep 2021 21:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A04B1BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06200605CC
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycMgVDkBMUQp for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F3F16001B
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E66C288EAA; Fri, 10 Sep 2021 21:32:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:59:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1e8594f0926c7867b0efbff5fafa411e54c2782
X-Git-Newrev: fde22d8c7750324ab97c2bea6d1e8adad9c04251
X-Patchwork-Hint: ignore
Message-Id: <20210910213230.E66C288EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: update URL in
 Config.in file
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
Content-Type: multipart/mixed; boundary="===============0841711969047344962=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0841711969047344962==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fde22d8c7750324ab97c2bea6d1e8adad9c04251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The URL pointing to phytec.de is obsolete and not even used by
Buildroot.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bayer2rgb-neon/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
index ed065c1ed7..8fd18b4fa9 100644
--- a/package/bayer2rgb-neon/Config.in
+++ b/package/bayer2rgb-neon/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_BAYER2RGB_NEON
 	  to decode raw camera bayer to RGB using
 	  NEON hardware acceleration.
 
-	  https://git.phytec.de/bayer2rgb-neon/
+	  https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb
 
 comment "bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
 	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON

--===============0841711969047344962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0841711969047344962==--
