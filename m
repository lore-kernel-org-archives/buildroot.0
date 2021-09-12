Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A46C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:17:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F1760F6D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46F1760F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14575404C7;
	Sun, 12 Sep 2021 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lpb1cgaKd0DN; Sun, 12 Sep 2021 20:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F55340281;
	Sun, 12 Sep 2021 20:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4FC1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 956174025D
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0sutAknGr-L for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F584026F
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 96A6C8A47B; Sun, 12 Sep 2021 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:34:34 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9613e896303e656da0aaadb47986b93dae3cd2dc
X-Git-Newrev: 8e469e30f7caec596d9e4a6cdda6fd14ac56b623
X-Patchwork-Hint: ignore
Message-Id: <20210912201359.96A6C8A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/bayer2rgb-neon:
 update URL in Config.in file
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
Content-Type: multipart/mixed; boundary="===============0580193698608439704=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0580193698608439704==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8e469e30f7caec596d9e4a6cdda6fd14ac56b623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The URL pointing to phytec.de is obsolete and not even used by
Buildroot.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fde22d8c7750324ab97c2bea6d1e8adad9c04251)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============0580193698608439704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0580193698608439704==--
