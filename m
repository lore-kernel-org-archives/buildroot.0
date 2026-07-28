Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7784BC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FDE810C1;
	Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTYVcs1l19o6; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5510E810AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499095;
	bh=JBCCg+OrPe1mVyVV7ApACspvWq5LEUm4wY1aFORKhOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IMKNckX2NWzhSOHr83c82cd0Y0d8lLpUGdfx4aNIOvi00QCpeGfwpJNdJpI/+nqxa
	 BOUJqFLVPsD+4sGtvM08cHEOPrited4KLyvoHO/kL0XSnsExRm22XicKftsbR7hb5i
	 EXUts3TV8WzYZcIkFezK3ACQUP77DC4uz8/5DOLt6cEtLT1+4QTWklzGbYLW0xaEIH
	 3/8ZZKOarNg0VtqFCzOntVzQMqazpJJpH4fekkXTRT6+3Q3BI3PlWr9FxdkTvlTTCj
	 4VUMJg2RQJB+3+szYV4yi2tKpEm484xsKqiRd3klh5aMadF7qIfhaFB/D4fdoeTNoD
	 BBp6IkaozY4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5510E810AA;
	Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8384B197
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7529740471
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdRtpx4pdaOa for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC7FD40467
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC7FD40467
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D3E58B743; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 887162bbd244d95db3c969922a26bfc54f602a00
X-Git-Newrev: 26234b30e2ac3d907fb272261c4f7a2b713d7347
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.8D3E58B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: update email
 for Francois Perrad
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26234b30e2ac3d907fb272261c4f7a2b713d7347
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aa56f063fd5a4079b7360f17437ed75435d5688f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a3b42a00f..38f00fcf65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1117,7 +1117,7 @@ F:	board/visionfive2/
 F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
-N:	Francois Perrad <francois.perrad@gadz.org>
+N:	Francois Perrad <francois.perrad.86@gmail.com>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
