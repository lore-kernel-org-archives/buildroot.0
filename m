Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDC1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A9A61027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19A9A61027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54F9400DA;
	Sun, 14 Nov 2021 14:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mqla1T_6cWj; Sun, 14 Nov 2021 14:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0550A401FD;
	Sun, 14 Nov 2021 14:26:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA92E1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A95CF401FD
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6b-wCXcx12g for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:26:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAED7400DA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:26:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4280E8D245; Sun, 14 Nov 2021 14:22:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:26:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31bce3d6fb913032b81e7de23eddaac8c663ac7d
X-Git-Newrev: 399ad854cc210db728e06933b8a4ad9089176ec1
X-Patchwork-Hint: ignore
Message-Id: <20211114142215.4280E8D245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mksh: fix project URL in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=399ad854cc210db728e06933b8a4ad9089176ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's http://www.mirbsd.org/mksh.htm

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mksh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/Config.in b/package/mksh/Config.in
index e6ccc90646..94f0d78ad5 100644
--- a/package/mksh/Config.in
+++ b/package/mksh/Config.in
@@ -22,4 +22,4 @@ config BR2_PACKAGE_MKSH
 	  operating environments
 	  (thus including patches from pdksh on e.g. Debian).
 
-	  http://mirbsd.de/mksh
+	  http://www.mirbsd.org/mksh.htm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
