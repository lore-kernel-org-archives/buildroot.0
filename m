Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE9CD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836C783B64;
	Wed, 20 May 2026 12:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkbGy0dH9sfE; Wed, 20 May 2026 12:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB15883B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278753;
	bh=/vX889jefZmb15TCh40zmw0evlg9P/PmBmDoO40LOmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b8lLhKcL0O5kPMlGiLgWVHwYcSYPL5lBTWfidZSEvd4Ko0VBO1p5AebvsN815CBs6
	 acLLfEbgG6SGQoKmLRj3rh9bOER7hvlWjxV+9jxilrqhIhBxs25hGcHwZRMOkuxQD7
	 7Q0tbjj4pFpOgIJ2dtiEXto4/qOhTiO8RAFA+gvezC3MjmYpCcMSLQji84UU0aZAYs
	 x1dEyqik0SUr+2aSHjQtpCcLWL/rtauxcDXM29OjH/OohsPU8Zcxkr0nGrzSIYY4fS
	 w84ktC01oDYOM/pEJg6/6MInVAtdbeas7/mQKU7kO7KLrDsiNUJnqrAsKaok7AEl0A
	 MdLHgbccBBlXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB15883B5C;
	Wed, 20 May 2026 12:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B66CC265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98C5561054
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-MDwYJbt0to for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D420261004
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D420261004
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C15C9868AE; Wed, 20 May 2026 12:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 14:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91d019e5e254467d20f29abe95112031a10345c3
X-Git-Newrev: fe893189c8b43ac48da8db3ee68c49088423faed
X-Patchwork-Hint: ignore
Message-Id: <20260520120542.C15C9868AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2026.02.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe893189c8b43ac48da8db3ee68c49088423faed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 9c4cc7ba0d..4210789507 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -47,25 +47,25 @@
           <th>2026.02.x</th>
           <td>June 2026</td>
           <td>
-            2026.02.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.1/CHANGES">
+            2026.02.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.2/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-04-21</td>
+          <td>2026-05-20</td>
           <td>
-            <a href="/downloads/buildroot-2026.02.1.tar.gz">
+            <a href="/downloads/buildroot-2026.02.2.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02.1.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.2.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2026.02.1.tar.xz">
+            <a href="/downloads/buildroot-2026.02.2.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2026.02.1.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2026.02.2.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
         <tr>
diff --git a/docs/website/news.html b/docs/website/news.html
index e50272188c..2265943c55 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.02.2 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>20 May 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2026.02.2 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2026.02.1 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.2/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2026.02.2-announce-1779278617@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.02.2.tar.xz">2026.02.2 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
