Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F08C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE59660EB9
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE59660EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8889882BF5;
	Tue,  3 Aug 2021 22:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLnqGWjmtNm6; Tue,  3 Aug 2021 21:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA7A83503;
	Tue,  3 Aug 2021 21:59:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27E141BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 128D440531
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxCVpCjFlk3P for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24861401FA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D6388B43C; Tue,  3 Aug 2021 21:09:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 19:28:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3e5a675dd6b3aa30122a69b902cd7fedca7e6ce
X-Git-Newrev: 10f8934c59ed8201bf38e00a18425ca1f49dc045
X-Patchwork-Hint: ignore
Message-Id: <20210803210939.6D6388B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/librelp: add
 LIBRELP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=10f8934c59ed8201bf38e00a18425ca1f49dc045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:rsyslog:librelp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arsyslog%3Alibrelp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librelp/librelp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index 0b2f5a20c9..f8bbdb131c 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -8,6 +8,7 @@ LIBRELP_VERSION = 1.10.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
+LIBRELP_CPE_ID_VENDOR = rsyslog
 LIBRELP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
