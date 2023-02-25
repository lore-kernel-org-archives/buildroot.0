Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA842C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E63140914;
	Sat, 25 Feb 2023 09:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E63140914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hjDywdkMDsa; Sat, 25 Feb 2023 09:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C2E4070F;
	Sat, 25 Feb 2023 09:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C2E4070F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0BBC1BF860
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79AB281E77
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79AB281E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP-eqOwReiJ4 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B900D81E68
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B900D81E68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2EE586911; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:37:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7edb4a6a4db7d864c6c1560f3fdc1ef4fbd7f0fd
X-Git-Newrev: edc6350d427bdd47552a276d80c6ad055add86af
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.A2EE586911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: update URL in Config.in
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edc6350d427bdd47552a276d80c6ad055add86af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current website is down:
https://github.com/amzn/hawktracer/issues/87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hawktracer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
index 7648707404..bee9c27b7d 100644
--- a/package/hawktracer/Config.in
+++ b/package/hawktracer/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HAWKTRACER
 	  profiling tool built in Amazon Video for getting performance
 	  metrics from low-end devices.
 
-	  https://www.hawktracer.org/
+	  https://hawktracer.github.io/
 
 if BR2_PACKAGE_HAWKTRACER
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
