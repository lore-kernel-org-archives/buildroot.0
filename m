Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7533DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C4160524
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43C4160524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B93360662;
	Tue,  3 Aug 2021 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYYI9MQ95Wsf; Tue,  3 Aug 2021 21:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8000E605E0;
	Tue,  3 Aug 2021 21:37:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17E541BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAB6D400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id far83PFMjIy0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37F0D4046D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 889C387BB7; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 14:19:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 14614d63f7ebc766cf276ae3dc44ef50a16d5562
X-Git-Newrev: 901689bfcc66af407b533515ec9623082383dc59
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.889C387BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-engineio: add
 PYTHON_ENGINEIO_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=901689bfcc66af407b533515ec9623082383dc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:python-engineio_project:python-engineio is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-engineio_project%3Apython-engineio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-engineio/python-engineio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index d0e073fa95..4f835da0a4 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -9,6 +9,7 @@ PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
+PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 # only needed/valid for python 3.x
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
