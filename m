Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8AB40ABF;
	Mon, 25 Apr 2022 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4CSCcL1i9PV; Mon, 25 Apr 2022 19:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F5B540AC1;
	Mon, 25 Apr 2022 19:07:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9BD1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3825F4167B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkm3fn3AWrqL for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388EB415A0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 105DF842E8; Mon, 25 Apr 2022 18:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 20:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 663b2edcd2be99638842edaf0406f4c984f32918
X-Git-Newrev: 0d6b874d94576f8b46153398c859f7831c08bb5f
X-Patchwork-Hint: ignore
Message-Id: <20220425185654.105DF842E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sam-ba: update link
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d6b874d94576f8b46153398c859f7831c08bb5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The link to at91.com is outdated and redirects to linux4sam.org

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
