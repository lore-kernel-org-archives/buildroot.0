Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA15C83F23
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E6914199B;
	Thu, 29 Aug 2024 13:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PcCFHXgJ6bC; Thu, 29 Aug 2024 13:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A539419B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A539419B7;
	Thu, 29 Aug 2024 13:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A85CA1BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9596C40118
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfAteXLKsnKz for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9452340791
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9452340791
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 822348669F; Thu, 29 Aug 2024 13:43:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:40:29 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 1519399c31dd514b3555f0807dd7472ae1eaf074
X-Git-Newrev: 24c56c6d88a641d2b79b91271b727bb71be2be00
X-Patchwork-Hint: ignore
Message-Id: <20240829134333.822348669F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/micropython:
 change URL to HTTPS
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
Content-Type: multipart/mixed; boundary="===============2438138540243236386=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2438138540243236386==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24c56c6d88a641d2b79b91271b727bb71be2be00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ade6e41831c2b1f82028dda9744c6b64907e20ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 849a5452f4..b466fbaf2d 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_MICROPYTHON
 	  3 programming language that is optimised to run on a
 	  microcontroller.
 
-	  http://micropython.org
+	  https://micropython.org
 
 if BR2_PACKAGE_MICROPYTHON
 

--===============2438138540243236386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2438138540243236386==--
