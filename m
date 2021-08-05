Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EA2C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48A460EE7
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D48A460EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9854E60783;
	Thu,  5 Aug 2021 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMrgAxJsJ-HM; Thu,  5 Aug 2021 20:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA216065D;
	Thu,  5 Aug 2021 20:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 290561BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18D094041F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8qZbVNd5Xgo for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32CF24056C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB57C8C53D; Thu,  5 Aug 2021 20:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:12:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 331c383b0326fd04cbaade4e6ae941846349426e
X-Git-Newrev: 46f932fa9efe4a5fe160cac599345238e1053b1a
X-Patchwork-Hint: ignore
Message-Id: <20210805201545.DB57C8C53D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/monit: add
 MONIT_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=46f932fa9efe4a5fe160cac599345238e1053b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

cpe:2.3:a:mmonit:monit is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ammonit%3Amonit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ef4b2e1e6d070bad65de3a2831d8246ff4ed176)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monit/monit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 93e310ff78..b9e131a363 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -8,6 +8,7 @@ MONIT_VERSION = 5.26.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
+MONIT_CPE_ID_VENDOR = mmonit
 #
 # Touching Makefile.am:
 MONIT_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
