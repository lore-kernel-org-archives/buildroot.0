Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A6CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3292F601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3292F601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D6F415BA;
	Tue,  3 Aug 2021 22:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEMqhEXPy-6F; Tue,  3 Aug 2021 22:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F423415AC;
	Tue,  3 Aug 2021 22:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5B61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC9C404D8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tcd1plemGctO for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CAD4051E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01F76810E2; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 May 2021 10:59:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 27c764153abae370106451779e88c32a6ba62c1d
X-Git-Newrev: eb72fa0d3cfe73217a96329c6b190cbfde63971c
X-Patchwork-Hint: ignore
Message-Id: <20210803210944.01F76810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pwgen: add
 PWGEN_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb72fa0d3cfe73217a96329c6b190cbfde63971c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:pwgen_project:pwgen is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apwgen_project%3Apwgen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pwgen/pwgen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index ad9465b82c..89925bb300 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -8,6 +8,7 @@ PWGEN_VERSION = 2.08
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
+PWGEN_CPE_ID_VENDOR = pwgen_project
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
