Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85484C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44969857C5;
	Fri, 28 Feb 2025 17:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSlldR59IKVd; Fri, 28 Feb 2025 17:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 568FD85998
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 568FD85998;
	Fri, 28 Feb 2025 17:08:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E1068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D148842F16
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nRtoPRjBWwE for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E55242A1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E55242A1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07F0284767; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:21:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bdcdc4428c4a64582daba9370d9eac92e2799e55
X-Git-Newrev: 225ea56e8fa92e9932effd5fa6a5a253dc3b9dc5
X-Patchwork-Hint: ignore
Message-Id: <20250228163025.07F0284767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: fix </div> soup
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
