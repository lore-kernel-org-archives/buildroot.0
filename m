Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DA9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:02:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F0060FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3F0060FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A432D60684;
	Sun, 19 Sep 2021 09:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rg5Olo6_vwxI; Sun, 19 Sep 2021 09:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0535460608;
	Sun, 19 Sep 2021 09:02:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2D711BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A11E9403D7
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7--tNaRWUgr1 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1E3403C7
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:02:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D94208B75E; Sun, 19 Sep 2021 09:00:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 11:00:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fe3a8f81b0507260b76e0a2734671e763180e7a
X-Git-Newrev: 7a888a71c315970808c541aaba163bb528be616c
X-Patchwork-Hint: ignore
Message-Id: <20210919090015.D94208B75E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rsa: add
 PYTHON_RSA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a888a71c315970808c541aaba163bb528be616c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:python-rsa_project:python-rsa is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-rsa_project%3Apython-rsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-rsa/python-rsa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index eaa47e8037..a3d4bb8235 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -10,5 +10,6 @@ PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/db/b5/475c45a58650b058
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
+PYTHON_RSA_CPE_ID_VENDOR = python-rsa_project
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
