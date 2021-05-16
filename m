Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CBFC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:58:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32C860FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E32C860FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACB783BCE;
	Tue,  3 Aug 2021 21:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OCbMv20-Sv6; Tue,  3 Aug 2021 21:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D56283B19;
	Tue,  3 Aug 2021 21:58:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16D041BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF1E4047B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rklbsux5lom6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA2C404E0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2CC788B43E; Tue,  3 Aug 2021 21:09:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 18:30:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea77594f3fb2bfab7fe0bb7417fdee0f3a6ccd9a
X-Git-Newrev: 00cb0f00fa6c5e992097c6cb6188da4606bac7a9
X-Patchwork-Hint: ignore
Message-Id: <20210803210939.2CC788B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/keepalived: add
 KEEPALIVED_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=00cb0f00fa6c5e992097c6cb6188da4606bac7a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:keepalived:keepalived is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeepalived%3Akeepalived

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/keepalived/keepalived.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 1a42d0c880..5d42cab741 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -9,6 +9,7 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
+KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
