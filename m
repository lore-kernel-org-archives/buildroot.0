Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B87C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D64F60F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D64F60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E620A80CCF;
	Tue, 17 Aug 2021 19:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jJbQ_s-tGPn; Tue, 17 Aug 2021 19:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B9880CD1;
	Tue, 17 Aug 2021 19:56:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9EC61BF9AC
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9C6C80C5F
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYMrj8RV734e for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 594EC80C4B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D23C68D3C3; Tue, 17 Aug 2021 19:55:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdb0b251bca194ceeb7b8707df29594a2ad2daf5
X-Git-Newrev: bf0b9048f216586614aa63ff9d1fd509f0155da3
X-Patchwork-Hint: ignore
Message-Id: <20210817195528.D23C68D3C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-secretstorage: depend
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf0b9048f216586614aa63ff9d1fd509f0155da3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The user shouldn't see the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-secretstorage/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 78a0a2ae15..8ae8c2d598 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	  https://github.com/mitya57/secretstorage
 
 comment "python-secretstorage needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
