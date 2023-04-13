Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B02C77B6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BCA60E90;
	Thu, 13 Apr 2023 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BCA60E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8LGwQ8bMgG7; Thu, 13 Apr 2023 20:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5BE60E81;
	Thu, 13 Apr 2023 20:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5BE60E81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD9111C3E21
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87C8A4031E
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 20:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C8A4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmC9200kqV0v for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 20:29:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C805E40516
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 20:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C805E40516
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41D9840AF; Thu, 13 Apr 2023 20:29:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 22:27:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 576d709a693aab13affdbe3d6dca5253e51a4877
X-Git-Newrev: 7c01d5a1bb3f863a14636a516cadc78ecb71a907
X-Patchwork-Hint: ignore
Message-Id: <20230413202913.B41D9840AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] doc/website: tap2open have sponsored the
 association again
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c01d5a1bb3f863a14636a516cadc78ecb71a907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.. so update and move their entry in the sponsors page.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/sponsors.html | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 9c17bed0c7..a90ca6c8df 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,6 +9,21 @@
     <div class="panel-body">
 
       <div class="row">
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.tap2open.com">
+		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+	        <a href="https://www.tap2open.com">Tap2Open</a>
+	        financially sponsored the <a href="/association.html">Buildroot Association</a>
+	        in 2020 and 2023.</div>
+	    </div>
+	  </div>
+	</div>
 
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
@@ -46,7 +61,9 @@
 	    </div>
 	  </div>
 	</div>
+      </div>
 
+      <div class="row">
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -348,24 +365,6 @@
 	</div>
       </div>
 
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="https://www.tap2open.com">
-		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
-	        <a href="https://www.tap2open.com">Tap2Open</a>
-	        financially sponsored the <a href="/association.html">Buildroot Association</a>
-	        in 2020.</div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-
     </div>
   </div>
 </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
