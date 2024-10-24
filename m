Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10D4D0BB62
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C9260AEE;
	Thu, 24 Oct 2024 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEY43ktRuj87; Thu, 24 Oct 2024 20:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED76860AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED76860AF2;
	Thu, 24 Oct 2024 20:33:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D97614960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C77DD60AF2
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-TBZah8UzhG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 622BA60AEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 622BA60AEE
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E00A83553; Thu, 24 Oct 2024 20:33:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:31:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9df4bbbc1d022da70dca765238e5fb890bd945d
X-Git-Newrev: 523f6c2ca96c971088723ff8612e1f076d647fe5
X-Patchwork-Hint: ignore
Message-Id: <20241024203337.4E00A83553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: update
 sponsors information
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

commit: https://git.buildroot.net/buildroot/commit/?id=523f6c2ca96c971088723ff8612e1f076d647fe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move Logilin to past sponsors, update details about Smile sponsoring
and Armadeus sponsoring, and likewise for a number of past sponsors.

The text about Smile as a past sponsor is reworded/reduced so that it
stills fits in the size of the block in a reasonable way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 83 +++++++++++++++++++---------------------------
 1 file changed, 34 insertions(+), 49 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index af691779f8..e90393be40 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -20,23 +20,6 @@
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
 
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
-	        in 2020 and 2023.</div>
-	    </div>
-	  </div>
-	</div>
-
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
@@ -46,10 +29,10 @@
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.smile.eu">Smile</a> sponsored the
+		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
-		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2023">Buildroot
-		Developers Meeting of February 2023</a> in Brussels,
+		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
+		Developers Meeting of February 2025</a> in Brussels,
 		after the FOSDEM
 		<a href="https://www.fosdem.org">conference</a>.
 	      </div>
@@ -69,30 +52,12 @@
 		<a href="http://www.opossom.com/english/index.html">Armadeus
 		Systems</a> financially sponsored
 		the <a href="/association.html">Buildroot
-		Association</a> in 2022.</div>
+		Association</a> in 2024.</div>
 	    </div>
 	  </div>
 	</div>
       </div>
 
-      <div class="row">
-	<div class="col-sm-4">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.logilin.fr">
-		  <img class="img-responsive center-block" src="images/logilin-logo.png"/>
-		</a>
-	      </div>
-	      <div class="col-sm-12" style="height: 150px;">
-		<a href="http://www.logilin.fr">Logilin</a>
-		financially sponsored the <a href="/association.html">Buildroot Association</a>
-		in 2022.</div>
-	    </div>
-	  </div>
-	</div>
-      </div>
-    </div>
     </div>
 
   <div class="panel panel-primary">
@@ -111,13 +76,14 @@
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="height: 400px;">
-	        <a href="https://www.smile.eu">Smile</a> provided the meeting location for the
-		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE 2019</a>
-		meeting and sponsored the Buildroot Summer Camp that took place on July 1-5 2016
-		in Toulouse, France. Smile sponsored the participation of Romain Naour and paid
-		the food expenses for the meeting participants.
-		In 2018, Smile sponsored of LLVM/Clang integration into Buildroot, see the final
-		<a href="http://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot">report</a>.
+	        <a href="https://www.smile.eu">Smile</a> provided the
+	        meeting location Buildroot Developers days after
+	        FOSDEM 2023, 2024 and 2025, for the
+		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE
+		2019</a> meeting and sponsored the Buildroot Summer
+		Camp 2016: Smile sponsored the participation of Romain
+		Naour.  In 2018, Smile sponsored of LLVM/Clang
+		integration into Buildroot.
 	      </div>
 	    </div>
 	  </div>
@@ -174,8 +140,8 @@
 	      </div>
 	      <div class="col-sm-12">
 		<a href="https://www.amarulasolutions.com/">Amarula
-		  Solutions</a> sponsored the event by contributing
-		financially to the <em>Buildroot Association</em>.
+		  Solutions</a> sponsored the <em>Buildroot
+		  Association</em> in 2018.
 	      </div>
 	    </div>
 	  </div>
@@ -213,7 +179,8 @@
 		<a href="http://www.logilin.fr">Logilin</a> sponsored
 		the ELCE 2018 Buildroot Developers meeting by
 		contributing financially to the <em>Buildroot
-		Association</em>.
+		Association</em>, and sponsored the Buildroot
+		Association in 2020, 2021 and 2022.
 	      </div>
 	    </div>
 	  </div>
@@ -377,6 +344,24 @@
 	</div>
       </div>
 
+      <div class="row">
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
+      </div>
+
     </div>
   </div>
 </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
