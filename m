Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D82C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B91E82C1E;
	Mon,  3 Feb 2025 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9uTtBI-TrRR; Mon,  3 Feb 2025 13:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4980E82C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4980E82C38;
	Mon,  3 Feb 2025 13:21:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8791A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A7FE412EF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1LLtbMKpkzD for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D5E410F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D5E410F7
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D70F868E4; Mon,  3 Feb 2025 13:21:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:21:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdcdc4428c4a64582daba9370d9eac92e2799e55
X-Git-Newrev: 225ea56e8fa92e9932effd5fa6a5a253dc3b9dc5
X-Patchwork-Hint: ignore
Message-Id: <20250203132142.3D70F868E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: fix </div> soup
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

commit: https://git.buildroot.net/buildroot/commit/?id=225ea56e8fa92e9932effd5fa6a5a253dc3b9dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit bdcdc4428c4a64582daba9370d9eac92e2799e55 got the div soup
wrong, adjust this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 1 -
 1 file changed, 1 deletion(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 54adfd25c3..e5fdbc8c88 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -73,7 +73,6 @@
 	    </div>
 	  </div>
 	</div>
-      </div>
 
     </div>
     </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
