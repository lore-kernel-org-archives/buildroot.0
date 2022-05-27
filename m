Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E07C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE0A241301;
	Fri, 27 May 2022 08:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNw3ckv1WRRE; Fri, 27 May 2022 08:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E3C412FF;
	Fri, 27 May 2022 08:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226001BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803DA412F0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKC_dOyreBjr for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51899412F4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65899865B7; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 09:53:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 325d6fd451283aca566c87a702962c2e635cf402
X-Git-Newrev: c9306ba84c97f020fd20a6e56c0d2143750eac6a
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.65899865B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sam-ba: update
 link
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9306ba84c97f020fd20a6e56c0d2143750eac6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The link to at91.com is outdated and redirects to linux4sam.org

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0d6b874d94576f8b46153398c859f7831c08bb5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sam-ba/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index b96e377e79..1967f33ab3 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -7,5 +7,5 @@ config BR2_PACKAGE_HOST_SAM_BA
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
 	  microcontrollers.
 
-	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
+	  https://www.linux4sam.org/bin/view/Linux4SAM/SoftwareTools
 	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
