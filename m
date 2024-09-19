Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757E8CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42AF9410DF;
	Thu, 19 Sep 2024 09:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYbczgw4occn; Thu, 19 Sep 2024 09:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC3B416B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC3B416B4;
	Thu, 19 Sep 2024 09:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CB121BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724898494A
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdCGqyml7EBC for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D91C0846BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D91C0846BA
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33F583C4D; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:12 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 3c7f868fe6d82d22125a7101b7209550cb27d976
X-Git-Newrev: e5f7a9fb71679c9cba30f4067c09fce33d44d055
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.D33F583C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] docs/website/news.html:
 fix information typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5f7a9fb71679c9cba30f4067c09fce33d44d055
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Plural of information is also information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd6584715ea4cec33d587ccb965fc599081c6233)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index c09db758a6..abd2f8e543 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -7352,7 +7352,7 @@
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and
-	  addition of licensing informations on many
+	  addition of licensing information on many
 	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">CHANGES</a>
 	  file for details</p>
 
@@ -7374,7 +7374,7 @@
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and addition
-	  of licensing informations on many
+	  of licensing information on many
 	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc2">CHANGES</a>
 	  file for details</p>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
