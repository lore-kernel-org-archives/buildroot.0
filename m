Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C42BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1DF41D85;
	Tue, 21 Feb 2023 00:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1DF41D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gx07-mViLFc; Tue, 21 Feb 2023 00:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EABE94F1CB;
	Tue, 21 Feb 2023 00:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EABE94F1CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03A4A1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01DBD6FB28
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DBD6FB28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBxLojig731a for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0E626FAA8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E626FAA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC10E828C8; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 22:21:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ac2b26fba2ad06fadf14244505319dc5c272906c
X-Git-Newrev: fce9f0eea00ed9aaeca12c1529ea380617baa477
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.EC10E828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: update
 sponsors.html page
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

commit: https://git.buildroot.net/buildroot/commit/?id=fce9f0eea00ed9aaeca12c1529ea380617baa477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Thank Smile for sponsoring the Buildroot Developers Meeting of
  February 2023 by providing the meeting room

- Thank Armadeus and Logilin for their financial sponsoring in 2022

- Move older sponsors to the "Past sponsors" section

- Remove section about the Buildroot.org domain sponsor, as that
  sponsoring ended in 2019.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/images/armadeus-systems-logo.png | Bin 0 -> 43363 bytes
 docs/website/sponsors.html                    |  69 +++++++++++++++++---------
 2 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/docs/website/images/armadeus-systems-logo.png b/docs/website/images/armadeus-systems-logo.png
new file mode 100644
index 0000000000..9b6080fb13
Binary files /dev/null and b/docs/website/images/armadeus-systems-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 2f3f6309ae..9c17bed0c7 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,18 +9,40 @@
     <div class="panel-body">
 
       <div class="row">
+
 	<div class="col-sm-4">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
 	      <div class="col-sm-12" style="height: 150px;">
-		<a href="https://www.tap2open.com">
-		  <img class="img-responsive center-block" src="images/tap2open-logo.png"/>
+		<a href="https://www.smile.eu">
+		  <img class="img-responsive center-block" src="images/smile-logo.png"/>
 		</a>
 	      </div>
 	      <div class="col-sm-12" style="height: 150px;">
-	        <a href="https://www.tap2open.com">Tap2Open</a>
-	        financially sponsored the <a href="/association.html">Buildroot Association</a>
-	        in 2020.</div>
+		<a href="http://www.smile.eu">Smile</a> sponsored the
+		Buildroot project by hosting
+		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2023">Buildroot
+		Developers Meeting of February 2023</a> in Brussels,
+		after the FOSDEM
+		<a href="https://www.fosdem.org">conference</a>.
+	      </div>
+	    </div>
+	  </div>
+	</div>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 180px;">
+		<a href="http://www.opossom.com/english/index.html">
+		  <img class="img-responsive center-block" src="images/armadeus-systems-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="http://www.opossom.com/english/index.html">Armadeus
+		Systems</a> financially sponsored
+		the <a href="/association.html">Buildroot
+		Association</a> in 2022.</div>
 	    </div>
 	  </div>
 	</div>
@@ -36,7 +58,7 @@
 	      <div class="col-sm-12" style="height: 150px;">
 		<a href="http://www.logilin.fr">Logilin</a>
 		financially sponsored the <a href="/association.html">Buildroot Association</a>
-		in 2020.</div>
+		in 2022.</div>
 	    </div>
 	  </div>
 	</div>
@@ -44,23 +66,6 @@
     </div>
     </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Sponsor of the Buildroot.org domain</div>
-    <div class="panel-body">
-      <div class="col-sm-6">
-	<p>The Buildroot community would like to thank
-          <a href="http://www.zillabit.com/">Zillabit</a> for
-	  donating the <b>buildroot.org</b> domain name and sponsoring
-	  the registration fees 2009 - 2019.</p>
-       </div>
-      <div class="col-sm-6">
-	<a href="http://www.zillabit.com">
-	  <img class="img-responsive center-block" src="images/zillabit-logo.png"/>
-	</a>
-      </div>
-    </div>
-  </div>
-
   <div class="panel panel-primary">
     <div class="panel-heading">Past sponsors</div>
     <div class="panel-body">
@@ -343,6 +348,24 @@
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
+	        in 2020.</div>
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
