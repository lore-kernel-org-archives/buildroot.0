Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE72C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4879C610FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4879C610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA5D81CDC;
	Tue,  7 Sep 2021 06:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSheBd7aklG8; Tue,  7 Sep 2021 06:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69ED781CA5;
	Tue,  7 Sep 2021 06:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7571BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18AB2404C3
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYe0q0v9uju8 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:39:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 399AB404C0
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2070188792; Tue,  7 Sep 2021 06:38:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 08:36:59 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f86351591d2e79a3058bb11e0cbc84632c466e0a
X-Git-Newrev: 3f3ed8b6feb64ff284108c5f1eb8c3a274d611f0
X-Patchwork-Hint: ignore
Message-Id: <20210907063822.2070188792@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/belle-sip: add
 BELLE_SIP_CPE_ID_VENDOR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f3ed8b6feb64ff284108c5f1eb8c3a274d611f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:linphone:belle-sip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinphone%3Abelle-sip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a4a4330b73d494201ec72ea40fc34e96fb41faf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/belle-sip/belle-sip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index 23b60e51f5..11b96f3fd9 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -9,6 +9,7 @@ BELLE_SIP_SITE = \
 	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
 BELLE_SIP_LICENSE = GPL-3.0+
 BELLE_SIP_LICENSE_FILES = LICENSE.txt
+BELLE_SIP_CPE_ID_VENDOR = linphone
 BELLE_SIP_INSTALL_STAGING = YES
 BELLE_SIP_DEPENDENCIES = \
 	bctoolbox \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
