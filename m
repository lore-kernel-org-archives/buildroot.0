Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFE0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA3460F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA3460F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D3F34064A;
	Wed,  4 Aug 2021 00:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jq3V7mbGtnEH; Wed,  4 Aug 2021 00:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B2F540638;
	Wed,  4 Aug 2021 00:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 638BA1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E5C40EED
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZvZNzcPZyrR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC61340686
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4049085586; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:01:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d3dd830585610b1253ad66f921fab0ad059fda4
X-Git-Newrev: 7e913bf36e57414720ade33edd7db3d3bcfce935
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.4049085586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tpm2-tools: add
 TPM2_TOOLS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e913bf36e57414720ade33edd7db3d3bcfce935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:tpm2-tools_project:tpm2-tools is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atpm2-tools_project%3Atpm2-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tools/tpm2-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index e83db416aa..584b4edb54 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -8,6 +8,7 @@ TPM2_TOOLS_VERSION = 4.3.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
+TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
