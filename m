Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A144D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001654078A;
	Tue, 13 Jan 2026 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vmt7RaSEdzy; Tue, 13 Jan 2026 19:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E888340597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333274;
	bh=RTGmqzEIvIFAdOyoJPFc8BxsyNoCiKHRFlitwM7IJzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cPAQRSX3jYBLOs26xctgfwTy88hFC1MivVCr+n3ghGxEMUG7b3NPzxtAL7CM2JJgT
	 vYqLrSxQxpDOPBYV0S/lisfDqCuHg80hyaNZUDZF/P1WLldayRd57M6Gs+M58HFRRY
	 dTa4HSXIrdjGPVojlOjjzGIdOXa3L+5lf1j0q+yP2/UlepWntsEUiK75Kt71Ks5fbE
	 uZag7R8jkZI3QRqZXtVjjJyfHfJiL3vXeBg2s/w0m1Y745133EjCFULU6bwJiKa60/
	 iBpsga7s/35rd0qJYAREGmSpLWVweI07HF+bIQRBfD7iZjnA30/7vnO3h6vNY6iPHw
	 q9ml3HH/HotFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E888340597;
	Tue, 13 Jan 2026 19:41:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88B1D1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1042406F3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzcur0garL_F for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CFE406EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CFE406EB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0388380840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:51:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 802aa14e374a11e020fc8eba7ea27833ca8ea100
X-Git-Newrev: 16ae65733364f02458017d1a619e5d81861e4bf6
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.0388380840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libdill: update
 project URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=16ae65733364f02458017d1a619e5d81861e4bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

https://github.com/sustrik/libdill/pull/228

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f615dcb271aef7e7ca56ff83c8f88b78dcc7e906)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libdill/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdill/Config.in b/package/libdill/Config.in
index 2376fc9698..ec649c6600 100644
--- a/package/libdill/Config.in
+++ b/package/libdill/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
 	  Libdill is a C library that makes writing structured
 	  concurrent programs easy.
 
-	  http://libdill.org
+	  https://sustrik.github.io/libdill/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
