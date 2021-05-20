Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5548C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FAD60243
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98FAD60243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA8840647;
	Tue,  3 Aug 2021 22:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_PIjV61Y8a8; Tue,  3 Aug 2021 22:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC6D40620;
	Tue,  3 Aug 2021 22:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD89D1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F1C40591
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFRwZJ_fC2sS for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 140DE40532
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5DBA0810E2; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 21:41:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06a0b113304df2d276b7d3f2f2871b0943a56741
X-Git-Newrev: 9e3e57394bd1268af5a79181080a8a9ad843b7f1
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.5DBA0810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfuse3: add CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e3e57394bd1268af5a79181080a8a9ad843b7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:libfuse_project:libfuse is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibfuse_project%3Alibfuse

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfuse3/libfuse3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index d61e313391..b1624ba887 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -8,6 +8,8 @@ LIBFUSE3_VERSION = 3.10.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
+LIBFUSE3_CPE_ID_VENDOR = libfuse_project
+LIBFUSE3_CPE_ID_PRODUCT = libfuse
 LIBFUSE3_INSTALL_STAGING = YES
 LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE3_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
