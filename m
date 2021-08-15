Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C78C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078D860E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 078D860E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A4B80EE5;
	Thu, 26 Aug 2021 22:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPRFwxreJP0Z; Thu, 26 Aug 2021 22:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F39380CCA;
	Thu, 26 Aug 2021 22:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 130921BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3523C4077C
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_Q_bw1_J5NJ for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C962407A6
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C20C28DC52; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 16:52:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 634dcbd50dd5cf4b25153689e61bcba45163c841
X-Git-Newrev: d55535622ffd5b138782ad90e785252c6b5b4a1b
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.C20C28DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jszip: add
 JSZIP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d55535622ffd5b138782ad90e785252c6b5b4a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:jszip_project:jszip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajszip_project%3Ajszip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jszip/jszip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index 13ea377169..a93766be11 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -8,6 +8,7 @@ JSZIP_VERSION = 3.2.2
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
+JSZIP_CPE_ID_VENDOR = jszip_project
 
 # 0001-fix-Use-a-null-prototype-object-for-this-files.patch
 JSZIP_IGNORE_CVES += CVE-2021-23413
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
