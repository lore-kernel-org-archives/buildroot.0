Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3605C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB2660F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CB2660F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E5283CBE;
	Wed,  4 Aug 2021 14:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sS1TmrYrngpN; Wed,  4 Aug 2021 14:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFDA83CC9;
	Wed,  4 Aug 2021 14:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCDC1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BD1640590
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLe7WrKuwvYX for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:05:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0B1405F0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:05:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 453BF8B547; Wed,  4 Aug 2021 14:05:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:04:37 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 1b77509ed0b43ad1ad4e6ecd947d4d3c49b93aaf
X-Git-Newrev: 9dfa5839700c50ace1e167689ac26d71337e0ff2
X-Patchwork-Hint: ignore
Message-Id: <20210804140518.453BF8B547@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/lrzsz: add
 LRZSZ_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dfa5839700c50ace1e167689ac26d71337e0ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

cpe:2.3:a:lrzsz_project:lrzsz is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alrzsz_project%3Alrzsz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2352c827311aefbbd83459bfaf359dff8c0fa7df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzsz/lrzsz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 6c68232852..45c88619e0 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -9,6 +9,7 @@ LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING
+LRZSZ_CPE_ID_VENDOR = lrzsz_project
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
