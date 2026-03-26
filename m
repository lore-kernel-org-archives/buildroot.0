Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6210AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33ECA60E93;
	Thu, 26 Mar 2026 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yz-wue-LcAS7; Thu, 26 Mar 2026 20:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9403D60E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774556181;
	bh=exky4jey8dyBM9SwVC8VTL3L8HkIUr1wLfes7aei7aE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NPpzistjyW9iLPeT4BaBILQoq3B92zVAyDr6Ju/GppXnoja7IlPAL2kXY8ol91ASu
	 oyyHi3P27lJ8Xsw3a9YPnDfVSE6KOil+nAejiLdhoEFVyhLl2g0y/PDH0xkfdyLLbh
	 7GwTcQ19Ofq9qWviM3Qn4OxBtwK66kswT45k07vBt2IyjJx6rZlnskHhOpm3vTAbZG
	 LjeY9x+leAHeLmblL4DIp+yGHenCcHHUvs0+53Qjd0iR+RYjKHJULESNus+dG3H+su
	 88CHVAoCPJRKTjCgTizIjBKyIYl92+90rf0W96BYjosj/AfyVcniw6MlcZ0Ve72zny
	 h6cTw1t+Fb3XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9403D60E9D;
	Thu, 26 Mar 2026 20:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E32403A5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C969881303
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgZtCoPcg-V1 for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E3181418
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E3181418
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F19797FA5F; Thu, 26 Mar 2026 20:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 21:07:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4749b83e59910eb13b72db6d093d37940f7a747b
X-Git-Newrev: a667cbe134d3be2e9ad3866a984eefba18ed6e61
X-Patchwork-Hint: ignore
Message-Id: <20260326201616.F19797FA5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add security contact
 information on the homepage
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a667cbe134d3be2e9ad3866a984eefba18ed6e61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/index.html | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/website/index.html b/docs/website/index.html
index d68436c721..027fd485e0 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -148,4 +148,15 @@
   </div>
 </div><!-- /container -->
 
+<div class="container">
+  <div class="row mt centered">
+    <div class="col-lg-6 col-lg-offset-3">
+      <h1>Security</h1>
+      <h3>To report a security vulnerability, please send an email to
+	<a href="mailto:security@buildroot.org">security@buildroot.org</a>.</h3>
+    </div>
+  </div><!-- /row -->
+  <hr>
+</div><!-- /container -->
+
 <!--#include file="footer.html" -->
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
