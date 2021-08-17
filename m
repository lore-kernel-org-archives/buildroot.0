Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FEEC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:14:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB5760231
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AB5760231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1103880BE9;
	Thu, 26 Aug 2021 22:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3i5xON5fW2uC; Thu, 26 Aug 2021 22:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F92282F11;
	Thu, 26 Aug 2021 22:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB21C1C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1964582C35
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzYNLs52hy_6 for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F20382CFD
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E47178DC50; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:55:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c86130313b28492807e32f00c6a01a99519f7c12
X-Git-Newrev: bf716f3d51c20510ddbd66181d104a3ea3ac9325
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.E47178DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-treq: depend
 comment on BR2_PACKAGE_PYTHON3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf716f3d51c20510ddbd66181d104a3ea3ac9325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The user shouldn't see the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-treq/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 47719f92bf..02c26a53f7 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -18,4 +18,5 @@ config BR2_PACKAGE_PYTHON_TREQ
 	  https://github.com/twisted/treq
 
 comment "python-treq needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
