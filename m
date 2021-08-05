Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C39C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A805061004
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A805061004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 715074041F;
	Thu,  5 Aug 2021 20:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcRD3JioOMtM; Thu,  5 Aug 2021 20:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC974056C;
	Thu,  5 Aug 2021 20:16:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86C631BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 764B540571
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltZfB3f5st9N for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 284B04041F
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF0118C55A; Thu,  5 Aug 2021 20:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:12:05 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: caa26c05096602789f35f7608a7ed3662749b8fa
X-Git-Newrev: 331c383b0326fd04cbaade4e6ae941846349426e
X-Patchwork-Hint: ignore
Message-Id: <20210805201545.CF0118C55A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/iodine: add
 IODINE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=331c383b0326fd04cbaade4e6ae941846349426e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

cpe:2.3:a:kryo:iodine is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akryo%3Aiodine

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c42db433ded2dc6bbb8252fed49c99928dc3462)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iodine/iodine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 711d709c1d..5de6389189 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -9,6 +9,7 @@ IODINE_SITE = http://code.kryo.se/iodine
 IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
+IODINE_CPE_ID_VENDOR = kryo
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
