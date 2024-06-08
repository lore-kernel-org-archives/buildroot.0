Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F53CC27C55
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B544275F;
	Sat,  8 Jun 2024 08:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-_eXlhGSsGA; Sat,  8 Jun 2024 08:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A38427E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A38427E4;
	Sat,  8 Jun 2024 08:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05D61BF863
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C986F4275F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgSe85juN0ZE for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 08:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E89405C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E89405C8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 08:16:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B16BB7FCBA; Sat,  8 Jun 2024 08:16:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 10:10:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bacb1c67eca1c007a23a134db1830a04482a0855
X-Git-Newrev: 7d89442eeed37aea8efd93e9806ee87128575e5c
X-Patchwork-Hint: ignore
Message-Id: <20240608081616.B16BB7FCBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/website/index.html:
 refer to Gitlab and lore
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d89442eeed37aea8efd93e9806ee87128575e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Our index.html page still points to git.buildroot.net as the Git
repository, and to the defunct gmane for the mailing list
activity. Fix these by pointing to Gitlab and lore respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3e3bcd633875db0e1f366e86fe8763b5b2d9112e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/index.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index 300adbb83d..d68436c721 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -133,14 +133,14 @@
   <div class="row">
     <div class="col-sm-6">
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://git.buildroot.net/buildroot"><h5>Recent commits</h5></a></div>
+	<div class="panel-heading"><a href="https://gitlab.com/buildroot.org/buildroot/"><h5>Recent commits</h5></a></div>
 	<div class="panel-box panel-body ellipsis" id="commit-activity">
 	</div>
       </div>
     </div>
     <div class="col-sm-6" >
       <div class="panel panel-primary">
-	<div class="panel-heading"><a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h5>Recent discussions</h5></a></div>
+	<div class="panel-heading"><a href="https://lore.kernel.org/buildroot/"><h5>Recent discussions</h5></a></div>
 	<div class="panel-box panel-body ellipsis" id="mailing-list-activity">
 	</div>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
