Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A998DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC3360720
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AC3360720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E416400C7;
	Tue,  3 Aug 2021 22:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clZMKF61Liq4; Tue,  3 Aug 2021 22:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 424C240195;
	Tue,  3 Aug 2021 22:16:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3FB1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 696F040441
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfCTSqvXIMZM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 290FB40451
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7C98D83875; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 22:26:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 81c93749ae4b09023e864b5980d4f0a543445764
X-Git-Newrev: 778e2e0467b2c6e59682692421dfe9319ea0adf0
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.7C98D83875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/synergy: add
 SYNERGY_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=778e2e0467b2c6e59682692421dfe9319ea0adf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:symless:synergy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asymless%3Asynergy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/synergy/synergy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 63c6e5cbc1..bc7ebea070 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -8,6 +8,7 @@ SYNERGY_VERSION = 2.0.12-beta
 SYNERGY_SITE = $(call github,symless,synergy-core,v$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
+SYNERGY_CPE_ID_VENDOR = symless
 SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
 
 # Avoid using buildroot commit hash inside cmake/Version.cmake
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
