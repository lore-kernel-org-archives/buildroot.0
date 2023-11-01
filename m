Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6CEC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B9D43290;
	Wed,  1 Nov 2023 21:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B9D43290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHFmX6WMAr2d; Wed,  1 Nov 2023 21:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E266743297;
	Wed,  1 Nov 2023 21:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E266743297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC2121BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2CF481EE0
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2CF481EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVaz0mrkuovD for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E13681210
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E13681210
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29209864CB; Wed,  1 Nov 2023 21:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:55:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be9f72278f6b6826b75af4536b62743c5b37b737
X-Git-Newrev: 2476faa2adfea9d77cd872e30445cab365efafea
X-Patchwork-Hint: ignore
Message-Id: <20231101215536.29209864CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/support.html: add Amarula
 Solutions to the commercial support list
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

commit: https://git.buildroot.net/buildroot/commit/?id=2476faa2adfea9d77cd872e30445cab365efafea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After talking with Thomas Petazzoni, it is agreed that Amarulasolutions should
be added to the list of companies that can provide commercial support for
Buildroot.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/support.html | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 90231f601c..9be816f836 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -111,6 +111,9 @@
 	    <a href="https://www.smile.eu/en/offers/embedded-iot">
 	      <img src="images/smile-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
+	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
+	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
+	    </a>
 	  </center>
 	</div>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
