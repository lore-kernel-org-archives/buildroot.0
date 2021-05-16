Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776B5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF8D60724
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BF8D60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB9083AC3;
	Tue,  3 Aug 2021 21:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBRnHIPyHMdH; Tue,  3 Aug 2021 21:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467B683AE5;
	Tue,  3 Aug 2021 21:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A22E1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 463FE40493
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhUCK2o_pWLV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD3DC404D9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F027887BB7; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 18:30:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7b8832a5e9dc50712b58e28f3be2b1a8497a6d3
X-Git-Newrev: 2ad812a0b3d2ade17100dc996040f3f5c43cacdf
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.F027887BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/enscript: add
 ENSCRIPT_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ad812a0b3d2ade17100dc996040f3f5c43cacdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:gnu:enscript is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aenscript

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/enscript/enscript.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index fbc9e69dae..441ae3dad4 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -8,6 +8,7 @@ ENSCRIPT_VERSION = 1.6.6
 ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPL-3.0+
 ENSCRIPT_LICENSE_FILES = COPYING
+ENSCRIPT_CPE_ID_VENDOR = gnu
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
