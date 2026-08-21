Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56153C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F35CA81281;
	Fri, 21 Aug 2026 21:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIoRESVeE_B4; Fri, 21 Aug 2026 21:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787346795;
	bh=ei+sor4Fur/pD1RmAdbxpjMp0YU6SIzQZuoVVAVQxXY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iUPRi3FHtscu8n206TukiXiGHyPwKMpDFkTqACaKc2kuWG8/fw2jhUcswfu2dDr//
	 UpRgbYJEv0IJk7kcCmLlq5KpCMAFYOynXouKn9IQoqrxjMoGry8hWm0yiAvLaFxwvw
	 HtPrxTeSInzEsRqXkDYbvB8ZW9g+03luAFSHdNEwijEd3dpkgX+rS3ACPyUNUcHjHG
	 u6Wp1SvL5+Xpf9iDaPGdJkDuh6WujQanoy4uU49tPA3bAO57fjw5l3UXQtTVJ89nTF
	 vtM8XsA4zwFm4IdOHaINUSNc0etI8/zLkIip3UIi5SbKOic6/x4nkrM4p7EsAxEGXP
	 QgTAa/Y+Cs27Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CDA981288;
	Fri, 21 Aug 2026 21:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDAA93F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8EE40096
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e11KrKBYoWTh for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 21:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA32A40079
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 21:13:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7C018E28D; Fri, 21 Aug 2026 21:12:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 23:11:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5795000c25c89db3f568c4039b21a256fc662706
X-Git-Newrev: b088e5dbe43d1c31add4b99cd05b8ba71228761a
X-Patchwork-Hint: ignore
Message-Id: <20260821211218.E7C018E28D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b088e5dbe43d1c31add4b99cd05b8ba71228761a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix significant -> significantly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 310fe80585..a0002ce188 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -664,7 +664,7 @@ Creating a basic test case involves:
   advantage of using +infra.basetest.BASIC_TOOLCHAIN_CONFIG+ is that a
   matching Linux kernel image is provided, which allows to boot the
   resulting image in Qemu without having to build a Linux kernel image
-  as part of the test case, therefore significant decreasing the build
+  as part of the test case, therefore significantly decreasing the build
   time required for the test case.
 
 * Implementing a +def test_run(self):+ function to implement the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
