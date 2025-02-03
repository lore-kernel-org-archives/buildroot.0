Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD2C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D5C70431;
	Fri, 28 Feb 2025 17:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM0k7adM6FhY; Fri, 28 Feb 2025 17:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2BA709B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2BA709B3;
	Fri, 28 Feb 2025 17:08:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1388868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBF9442A1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_zb297AtLN9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2DDB42F14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2DDB42F14
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3F187A55; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:17:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29088086b5144fb37dd4c88da2de5e07605b7781
X-Git-Newrev: bdcdc4428c4a64582daba9370d9eac92e2799e55
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.EE3F187A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: add Open Home
 Foundation to the sponsors
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdcdc4428c4a64582daba9370d9eac92e2799e55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Open Home Foundation generously sponsored the Buildroot project
end of 2024, credit them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/images/openhomefoundation-logo.png | Bin 0 -> 9533 bytes
 docs/website/sponsors.html                      |  18 ++++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/docs/website/images/openhomefoundation-logo.png b/docs/website/images/openhomefoundation-logo.png
new file mode 100644
index 0000000000..ef932fb2a9
Binary files /dev/null and b/docs/website/images/openhomefoundation-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index e90393be40..54adfd25c3 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -56,9 +56,27 @@
 	    </div>
 	  </div>
 	</div>
+
+	<div class="col-sm-4">
+	  <div class="panel panel-default panel-sponsor">
+	    <div class="panel-body">
+	      <div class="col-sm-12" style="height: 180px;">
+		<a href="https://www.openhomefoundation.org/">
+		  <img class="img-responsive center-block" src="images/openhomefoundation-logo.png"/>
+		</a>
+	      </div>
+	      <div class="col-sm-12" style="height: 150px;">
+		<a href="https://www.openhomefoundation.org">Open Home
+		Foundation</a> financially sponsored
+		the <a href="/association.html">Buildroot
+		Association</a> in 2024.</div>
+	    </div>
+	  </div>
+	</div>
       </div>
 
     </div>
+    </div>
 
   <div class="panel panel-primary">
     <div class="panel-heading">Past sponsors</div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
