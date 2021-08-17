Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9FDC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B0B60E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16B0B60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E98D280CD3;
	Thu, 26 Aug 2021 22:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AVi4loYM429; Thu, 26 Aug 2021 22:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C04E81A95;
	Thu, 26 Aug 2021 22:26:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113C11BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7FEA4079F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aca8dRT9gfF for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E08B7407AC
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4E2AF8DC50; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 09:20:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e75050bbb9180b2d0861ca10a4c86fd004670dc
X-Git-Newrev: 5a3d1f34bcd5c5305b07ba268fa47d6c42a7f7ca
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.4E2AF8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libargtable2: update
 LIBARGTABLE2_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a3d1f34bcd5c5305b07ba268fa47d6c42a7f7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update LIBARGTABLE2_VERSION to reflect what is used by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libargtable2/libargtable2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 8215f552cd..d033e28f40 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIBARGTABLE2_VERSION = 13
-LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
+LIBARGTABLE2_MAJOR_VERSION = 2
+LIBARGTABLE2_MINOR_VERSION = 13
+LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
+LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz
+LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-$(LIBARGTABLE2_VERSION)
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPTS = \
 	--disable-example \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
