Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D63F531CE
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3873641FAD;
	Mon, 13 Apr 2026 21:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa2uPFDnpiwD; Mon, 13 Apr 2026 21:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E72041FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776114460;
	bh=kYlc9mVqNL5HmtSExgh0HawXsiBiy99d6tlhCcKj1hY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DCJYoTT5Iqj8XcEiKjl8MfXT2t4F8eUSbSUSG2sw+f61Nm61M2GlYbk0mx/t42Qk4
	 mq/EtQp9t1+vsDEaH+6g0iCSoNJCpSb7HsBUs9rMGv54ITY/flX1g8HFIWJNO4KaAd
	 B6Jd0AbyvhYNuaoAPNKhd1Gi4apngBAGaI76hU2jhpRe2hPsSYATrTyFVuxwi/9W+c
	 vHdEIdq/B5mwlsGKwOfRiLCrLQCyofClB8n6/Y+7TxwkUZSNIXanN3XtQEevbmgUDS
	 WMiklD1Luuy+y8kuH899cDaQhxrJYOzAR2LUTyZ+h7YByBp4/KkOSbnIi1/DEXC0Gs
	 ygd/+sHfPvW/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E72041FB0;
	Mon, 13 Apr 2026 21:07:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32383375
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2455B4064F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDIgBQRMS-9K for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 21:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EA634023F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA634023F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 21:07:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D167C813F8; Mon, 13 Apr 2026 21:07:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 23:04:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 329643baa5225f6262ed4411d4c1ca2829d46fdf
X-Git-Newrev: 9f79afbfb042176dba99c51e26653523fbf58169
X-Patchwork-Hint: ignore
Message-Id: <20260413210737.D167C813F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add SMC-Gateway as a bronze
 sponsor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f79afbfb042176dba99c51e26653523fbf58169
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SMC Gateway creates applications to enable communications simpler.

They produce an intelligent hub that connects radio networks with
various external systems.

We thanks them for contributing to the LTS maintenance as a bronze
sponsor.

[1] https://smc-gateway.com/
[2] https://www.linkedin.com/company/smc-gateway-ltd

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/images/smc-gateway-logo.png | Bin 0 -> 69324 bytes
 docs/website/sponsors.html               |  20 ++++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/docs/website/images/smc-gateway-logo.png b/docs/website/images/smc-gateway-logo.png
new file mode 100644
index 0000000000..b530f5ec0b
Binary files /dev/null and b/docs/website/images/smc-gateway-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 76182c602a..cf7cba9806 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -71,6 +71,26 @@
       </div>
     </div>
 
+    <div class="panel-body">
+      <h3>Bronze Sponsors</h3>
+      <div class="sponsors-container">
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://smc-gateway.com/">
+                  <img class="img-responsive center-block" style="height: 100%;" src="images/smc-gateway-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://smc-gateway.com/">SMC Gateway</a>
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
