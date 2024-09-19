Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C68CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A598141358;
	Thu, 19 Sep 2024 09:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbJiAcKxztij; Thu, 19 Sep 2024 09:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077A241C19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077A241C19;
	Thu, 19 Sep 2024 09:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5641BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 539A684396
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IX2PZvxCLdCT for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D585849C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D585849C8
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ADFB83C75; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:25 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 405d6898686362ecf8e7e927ad2e8abbfeb4adeb
X-Git-Newrev: 3afbac1c861c3a9999a0455f9779bff1c55ee626
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.8ADFB83C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/website/news.html:
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

commit: https://git.buildroot.net/buildroot/commit/?id=3afbac1c861c3a9999a0455f9779bff1c55ee626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Plural of information is also information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd6584715ea4cec33d587ccb965fc599081c6233)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index a51da7f4bb..3aae495011 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -7011,7 +7011,7 @@
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and
-	  addition of licensing informations on many
+	  addition of licensing information on many
 	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">CHANGES</a>
 	  file for details</p>
 
@@ -7033,7 +7033,7 @@
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
