Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9ADC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:09:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E48CF60F5D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E48CF60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59B34056D;
	Sat,  9 Oct 2021 12:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEctF5gkUkDo; Sat,  9 Oct 2021 12:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E38874056F;
	Sat,  9 Oct 2021 12:09:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4CD01BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2871040502
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u0PayPotYslZ for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0973840571
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41172947C1; Sat,  9 Oct 2021 12:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:47:21 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ddae54b6ffed39a201df95706a68cb585fcd65eb
X-Git-Newrev: 780c26a1073fe01c82856443284446b8ce73a314
X-Patchwork-Hint: ignore
Message-Id: <20211009120036.41172947C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/apache: change
 project URL to https
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=780c26a1073fe01c82856443284446b8ce73a314
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 96464f756217cd6bf7a1e17078f3671c4478d2e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 693ee20a1b..8b6a5bf7ea 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_APACHE
 	  server that provides HTTP services in sync with the current
 	  HTTP standards.
 
-	  http://httpd.apache.org
+	  https://httpd.apache.org
 
 if BR2_PACKAGE_APACHE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
