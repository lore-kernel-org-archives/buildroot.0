Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3B3D0E415
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1290409F1;
	Thu, 24 Oct 2024 20:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3TpOO8inW-t; Thu, 24 Oct 2024 20:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3389409F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3389409F4;
	Thu, 24 Oct 2024 20:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C34497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBD1780A06
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2NRPkhgTr7T for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D19809E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D19809E8
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4143B83552; Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:31:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2347e2f6902d050a7e19516e45afec4d4f107404
X-Git-Newrev: d9df4bbbc1d022da70dca765238e5fb890bd945d
X-Patchwork-Hint: ignore
Message-Id: <20241024203337.4143B83552@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: fix page layout
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9df4bbbc1d022da70dca765238e5fb890bd945d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LTS block was glued with the next block, add missing </div>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index bfb83663c6..af691779f8 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -13,6 +13,7 @@
          Program</a>.</p>
       <p>When the Buildroot LTS Sponsoring program will be operational
          later in 2024, those sponsors will be mentioned here.</p>
+      </div>
     </div>
 
     <div class="panel panel-primary">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
