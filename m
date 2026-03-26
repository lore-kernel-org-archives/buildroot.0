Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20DB10AB819
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 932BA60EC9;
	Thu, 26 Mar 2026 20:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JM1aHyVfpbWO; Thu, 26 Mar 2026 20:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7517260E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774555274;
	bh=bXbQHDvOpUr9g8HEFF71ngycgimD5b5RuEaL6u+h4UU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AhaVgpQUmbXKtZui1IQhaq/0BaFW1mjTwQJiVHQGDs7E00NicZnh0U/OvFIujm26b
	 efPeqpD3oXRmt02tAELgesYr2BwEq0oWlfwEcBFMK4Q6pBWQVO2SSM9T9JtwfLwE6I
	 Nt8QZLULITUkhV8kkccitn2hfFTAg+Ov9nMGTYSkxWXTxXExEBSWXkEBKqVt3bOafV
	 JJUvIc8I4POSMgBWnMpIQ1o5On7pQIQiqtLr00sHL4bjhgvZLuWwVNBQH3w0qESoir
	 GMH6HPRczTeFPpw3byWJuPtEMFRMPkhPwuRfwExe9sZYW2GxzTfn7ZBOdkLdBHz2Ok
	 vHPVRObL3+qJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7517260E45;
	Thu, 26 Mar 2026 20:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A901B353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFA460C14
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYLeMyNA-CEi for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE0060E38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABE0060E38
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECF8C7FA6C; Thu, 26 Mar 2026 20:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 20:36:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aef30aadfcc390ba939a89b72b4b6add87455da8
X-Git-Newrev: 4749b83e59910eb13b72db6d093d37940f7a747b
X-Patchwork-Hint: ignore
Message-Id: <20260326200109.ECF8C7FA6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/sponsors.html: add IPComm as a
 silver sponsor
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4749b83e59910eb13b72db6d093d37940f7a747b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

IPCOMM GmbH is a German company that develop industrial gateways and
inter-network communication solutions.

They agreed to sponsor the LTS maintenance for 2026. We thanks them for
their contribution.

 - https://www.ipcomm.de/
 - https://www.ipcomm.de/article/AboutUs/en/sheet.html

For more informations about the LTS sponsorship, see:

 - https://buildroot.org/lts.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/images/ipcomm-logo.png | Bin 0 -> 4241 bytes
 docs/website/sponsors.html          |  20 ++++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/docs/website/images/ipcomm-logo.png b/docs/website/images/ipcomm-logo.png
new file mode 100644
index 0000000000..376f4160ef
Binary files /dev/null and b/docs/website/images/ipcomm-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index f7ccbbedd5..76182c602a 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -51,6 +51,26 @@
     </div>
     </div>
 
+    <div class="panel-body">
+      <h3>Silver Sponsors</h3>
+      <div class="sponsors-container">
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://www.ipcomm.de">
+                  <img class="img-responsive center-block" style="height: 100%;" src="images/ipcomm-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://www.ipcomm.de">IPComm</a>
+              </div>
+            </div>
+          </div>
+        </div>
+      </div>
+    </div>
+
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
