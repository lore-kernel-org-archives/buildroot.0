Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5EFC28B28
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 10:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760C382222;
	Thu, 13 Mar 2025 10:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYLwjyqBbu26; Thu, 13 Mar 2025 10:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16AFD82196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16AFD82196;
	Thu, 13 Mar 2025 10:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AF54E0
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EA776102D
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFXtdZDI5WYk for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 10:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC8761026
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC8761026
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:42:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9232487F85; Thu, 13 Mar 2025 10:42:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 11:40:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53f74f49c039a41c97875b3e6fe871b8e82a013b
X-Git-Newrev: 873407b46c2b6b9e154be97bfdec61c9c8349229
X-Patchwork-Hint: ignore
Message-Id: <20250313104231.9232487F85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: refer to gitlab
 bug tracker
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=873407b46c2b6b9e154be97bfdec61c9c8349229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We moved the issue tracking to gitlab some time ago.  Adjust the bug tracker
references in news.html to point to there instead of bugzilla for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 352 ++++++++++++++++++++++++-------------------------
 1 file changed, 176 insertions(+), 176 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 03fcae660a..b643ce1b07 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -25,7 +25,7 @@
 	  <a href="/downloads/buildroot-2025.02-rc2.tar.xz">2025.02-rc2
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -203,7 +203,7 @@
 	  <a href="/downloads/buildroot-2024.11-rc3.tar.xz">2024.11-rc3
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -224,7 +224,7 @@
 	  <a href="/downloads/buildroot-2024.11-rc2.tar.xz">2024.11-rc2
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -444,7 +444,7 @@
 	  <a href="/downloads/buildroot-2024.08-rc2.tar.xz">2024.08-rc2
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -621,7 +621,7 @@
 	  <a href="/downloads/buildroot-2024.05-rc2.tar.xz">2024.05-rc2
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -642,7 +642,7 @@
 	  <a href="/downloads/buildroot-2024.05-rc1.tar.xz">2024.05-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -767,7 +767,7 @@
 	  <a href="/downloads/buildroot-2024.02-rc2.tar.xz">2024.02-rc2
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -826,7 +826,7 @@
 	  <a href="/downloads/buildroot-2024.02-rc1.tar.xz">2024.02-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -966,7 +966,7 @@
 	  <a href="/downloads/buildroot-2023.11-rc2.tar.xz">2023.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1025,7 +1025,7 @@
 	  <a href="/downloads/buildroot-2023.11-rc1.tar.xz">2023.11-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1201,7 +1201,7 @@
 	  <a href="/downloads/buildroot-2023.08-rc3.tar.xz">2023.08-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1222,7 +1222,7 @@
 	  <a href="/downloads/buildroot-2023.08-rc2.tar.xz">2023.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1243,7 +1243,7 @@
           <a href="/downloads/buildroot-2023.08-rc1.tar.xz">2023.08-rc1
             release</a>, and report any problems found to the
           <a href="support.html">mailing list</a> or
-          <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+          <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1340,7 +1340,7 @@
 	  <a href="/downloads/buildroot-2023.05-rc3.tar.xz">2023.05-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1361,7 +1361,7 @@
 	  <a href="/downloads/buildroot-2023.05-rc2.tar.xz">2023.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1382,7 +1382,7 @@
 	  <a href="/downloads/buildroot-2023.05-rc1.tar.xz">2023.05-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1507,7 +1507,7 @@
 	  <a href="/downloads/buildroot-2023.02-rc3.tar.xz">2023.02-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1566,7 +1566,7 @@
 	  <a href="/downloads/buildroot-2023.02-rc2.tar.xz">2023.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1587,7 +1587,7 @@
 	  <a href="/downloads/buildroot-2023.02-rc1.tar.xz">2023.02-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1703,7 +1703,7 @@
 	  <a href="/downloads/buildroot-2022.11-rc3.tar.xz">2022.11-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1762,7 +1762,7 @@
 	  <a href="/downloads/buildroot-2022.11-rc2.tar.xz">2022.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1783,7 +1783,7 @@
 	  <a href="/downloads/buildroot-2022.11-rc1.tar.xz">2022.11-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1883,7 +1883,7 @@
 	  <a href="/downloads/buildroot-2022.08-rc2.tar.xz">2022.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -1942,7 +1942,7 @@
 	  <a href="/downloads/buildroot-2022.08-rc1.tar.xz">2022.08-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2039,7 +2039,7 @@
 	  <a href="/downloads/buildroot-2022.05-rc2.tar.xz">2022.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2079,7 +2079,7 @@
 	  <a href="/downloads/buildroot-2022.05-rc1.tar.xz">2022.05-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2204,7 +2204,7 @@
 	  <a href="/downloads/buildroot-2022.02-rc3.tar.bz2">2022.02-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2263,7 +2263,7 @@
 	  <a href="/downloads/buildroot-2022.02-rc2.tar.bz2">2022.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2284,7 +2284,7 @@
 	  <a href="/downloads/buildroot-2022.02-rc1.tar.xz">2022.02-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2403,7 +2403,7 @@
 	  <a href="/downloads/buildroot-2021.11-rc3.tar.bz2">2021.11-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2424,7 +2424,7 @@
 	  <a href="/downloads/buildroot-2021.11-rc2.tar.bz2">2021.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2483,7 +2483,7 @@
 	  <a href="/downloads/buildroot-2021.11-rc1.tar.bz2">2021.11-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2621,7 +2621,7 @@
 	  <a href="/downloads/buildroot-2021.08-rc3.tar.bz2">2021.08-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2642,7 +2642,7 @@
 	  <a href="/downloads/buildroot-2021.08-rc2.tar.bz2">2021.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2701,7 +2701,7 @@
 	  <a href="/downloads/buildroot-2021.08-rc1.tar.bz2">2021.08-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2760,7 +2760,7 @@
 	  <a href="/downloads/buildroot-2021.05-rc3.tar.bz2">2021.05-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2781,7 +2781,7 @@
 	  <a href="/downloads/buildroot-2021.05-rc2.tar.bz2">2021.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2821,7 +2821,7 @@
 	  <a href="/downloads/buildroot-2021.05-rc1.tar.bz2">2021.05-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2927,7 +2927,7 @@
 	  <a href="/downloads/buildroot-2021.02-rc3.tar.bz2">2021.02-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -2986,7 +2986,7 @@
 	  <a href="/downloads/buildroot-2021.02-rc2.tar.bz2">2021.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3007,7 +3007,7 @@
 	  <a href="/downloads/buildroot-2021.02-rc1.tar.bz2">2021.02-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3145,7 +3145,7 @@
 	  <a href="/downloads/buildroot-2020.11-rc3.tar.bz2">2020.11-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3204,7 +3204,7 @@
 	  <a href="/downloads/buildroot-2020.11-rc2.tar.bz2">2020.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3225,7 +3225,7 @@
 	  <a href="/downloads/buildroot-2020.11-rc1.tar.bz2">2020.11-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3382,7 +3382,7 @@
 	  <a href="/downloads/buildroot-2020.08-rc3.tar.bz2">2020.08-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3403,7 +3403,7 @@
 	  <a href="/downloads/buildroot-2020.08-rc2.tar.bz2">2020.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3521,7 +3521,7 @@
 	  <a href="/downloads/buildroot-2020.05-rc3.tar.bz2">2020.05-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3542,7 +3542,7 @@
 	  <a href="/downloads/buildroot-2020.05-rc2.tar.bz2">2020.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3582,7 +3582,7 @@
 	  <a href="/downloads/buildroot-2020.05-rc1.tar.bz2">2020.05-rc1
 	  release</a>, and report any problems found to the
          <a href="support.html">mailing list</a> or
-         <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3726,7 +3726,7 @@
 	  <a href="/downloads/buildroot-2020.02-rc3.tar.bz2">2020.02-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3747,7 +3747,7 @@
 	  <a href="/downloads/buildroot-2020.02-rc2.tar.bz2">2020.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3770,7 +3770,7 @@
 	  <a href="/downloads/buildroot-2020.02-rc1.tar.bz2">2020.02-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3889,7 +3889,7 @@
 	  <a href="/downloads/buildroot-2019.11-rc3.tar.bz2">2019.11-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3910,7 +3910,7 @@
 	  <a href="/downloads/buildroot-2019.11-rc2.tar.bz2">2019.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -3971,7 +3971,7 @@
 	  <a href="/downloads/buildroot-2019.11-rc1.tar.bz2">2019.11-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4109,7 +4109,7 @@
 	  <a href="/downloads/buildroot-2019.08-rc3.tar.bz2">2019.08-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4130,7 +4130,7 @@
 	  <a href="/downloads/buildroot-2019.08-rc2.tar.bz2">2019.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4153,7 +4153,7 @@
 	  <a href="/downloads/buildroot-2019.08-rc1.tar.bz2">2019.08-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4250,7 +4250,7 @@
 	  <a href="/downloads/buildroot-2019.05-rc3.tar.bz2">2019.05-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4271,7 +4271,7 @@
 	  <a href="/downloads/buildroot-2019.05-rc2.tar.bz2">2019.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4295,7 +4295,7 @@
 	  <a href="/downloads/buildroot-2019.05-rc1.tar.bz2">2019.05-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4421,7 +4421,7 @@
 	  <a href="/downloads/buildroot-2019.02-rc3.tar.bz2">2019.02-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4481,7 +4481,7 @@
 	  <a href="/downloads/buildroot-2019.02-rc2.tar.bz2">2019.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4505,7 +4505,7 @@
 	  <a href="/downloads/buildroot-2019.02-rc1.tar.bz2">2019.02-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4643,7 +4643,7 @@
 	  <a href="/downloads/buildroot-2018.11-rc3.tar.bz2">2018.11-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4703,7 +4703,7 @@
 	  <a href="/downloads/buildroot-2018.11-rc2.tar.bz2">2018.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4727,7 +4727,7 @@
 	  <a href="/downloads/buildroot-2018.11-rc1.tar.bz2">2018.11-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4863,7 +4863,7 @@
 	  <a href="/downloads/buildroot-2018.08-rc3.tar.bz2">2018.08-rc3
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4923,7 +4923,7 @@
 	  <a href="/downloads/buildroot-2018.08-rc2.tar.bz2">2018.08-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -4947,7 +4947,7 @@
 	  <a href="/downloads/buildroot-2018.08-rc1.tar.bz2">2018.08-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5045,7 +5045,7 @@
 	  the <a href="/downloads/buildroot-2018.05-rc3.tar.bz2">2018.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5067,7 +5067,7 @@
 	  <a href="/downloads/buildroot-2018.05-rc2.tar.bz2">2018.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5091,7 +5091,7 @@
 	  <a href="/downloads/buildroot-2018.05-rc1.tar.bz2">2018.05-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5194,7 +5194,7 @@
 	  the <a href="/downloads/buildroot-2018.02-rc3.tar.bz2">2018.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5216,7 +5216,7 @@
 	  <a href="/downloads/buildroot-2018.02-rc2.tar.bz2">2018.02-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5240,7 +5240,7 @@
 	  <a href="/downloads/buildroot-2018.02-rc1.tar.bz2">2018.02-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5395,7 +5395,7 @@
 	  <a href="/downloads/buildroot-2017.11-rc2.tar.bz2">2017.11-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5418,7 +5418,7 @@
 	  <a href="/downloads/buildroot-2017.11-rc1.tar.bz2">2017.11-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5518,7 +5518,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5543,7 +5543,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5567,7 +5567,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5703,7 +5703,7 @@
 	  the <a href="/downloads/buildroot-2017.05-rc3.tar.bz2">2017.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5725,7 +5725,7 @@
 	  <a href="/downloads/buildroot-2017.05-rc2.tar.bz2">2017.05-rc2
 	  release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5749,7 +5749,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5852,7 +5852,7 @@
 	  the <a href="/downloads/buildroot-2017.02-rc3.tar.bz2">2017.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5874,7 +5874,7 @@
 	  <a href="/downloads/buildroot-2017.02-rc2.tar.bz2">2017.02-rc2
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5899,7 +5899,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -5978,7 +5978,7 @@
 	  the <a href="/downloads/buildroot-2016.11-rc3.tar.bz2">2016.11-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6002,7 +6002,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6027,7 +6027,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6089,7 +6089,7 @@
 	  the <a href="/downloads/buildroot-2016.08-rc3.tar.bz2">2016.08-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6111,7 +6111,7 @@
 	  <a href="/downloads/buildroot-2016.08-rc2.tar.bz2">2016.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6136,7 +6136,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6177,7 +6177,7 @@
 	  the <a href="/downloads/buildroot-2016.05-rc3.tar.bz2">2016.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6199,7 +6199,7 @@
 	  <a href="/downloads/buildroot-2016.05-rc2.tar.bz2">2016.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6224,7 +6224,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.buildroot.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6265,7 +6265,7 @@
 	  the <a href="/downloads/buildroot-2016.02-rc3.tar.bz2">2016.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6287,7 +6287,7 @@
 	  <a href="/downloads/buildroot-2016.02-rc2.tar.bz2">2016.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6312,7 +6312,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6372,7 +6372,7 @@
 	  the <a href="/downloads/buildroot-2015.11-rc3.tar.bz2">2015.11-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6394,7 +6394,7 @@
 	  the <a href="/downloads/buildroot-2015.11-rc2.tar.bz2">2015.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6419,7 +6419,7 @@
 	    release candidate</a>, and report any
 	  problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6481,7 +6481,7 @@
 	  <a href="/downloads/buildroot-2015.08-rc2.tar.bz2">2015.08-rc2
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6503,7 +6503,7 @@
 	  <a href="/downloads/buildroot-2015.08-rc1.tar.bz2">2015.08-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6544,7 +6544,7 @@
 	  the <a href="/downloads/buildroot-2015.05-rc3.tar.bz2">2015.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6566,7 +6566,7 @@
 	  <a href="/downloads/buildroot-2015.05-rc2.tar.bz2">2015.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6588,7 +6588,7 @@
 	  <a href="/downloads/buildroot-2015.05-rc1.tar.bz2">2015.05-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6630,7 +6630,7 @@
 	  <a href="/downloads/buildroot-2015.02-rc3.tar.bz2">2015.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6652,7 +6652,7 @@
 	  <a href="/downloads/buildroot-2015.02-rc2.tar.bz2">2015.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6676,7 +6676,7 @@
 	    release candidate</a>, and report any problems found to
 	  the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6717,7 +6717,7 @@
 	  <a href="/downloads/buildroot-2014.11-rc3.tar.bz2">2014.11-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6739,7 +6739,7 @@
 	  <a href="/downloads/buildroot-2014.11-rc2.tar.bz2">2014.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6787,7 +6787,7 @@
 	  <a href="/downloads/buildroot-2014.11-rc1.tar.bz2">2014.11-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6828,7 +6828,7 @@
 	  <a href="/downloads/buildroot-2014.08-rc3.tar.bz2">2014.08-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6850,7 +6850,7 @@
 	  <a href="/downloads/buildroot-2014.08-rc2.tar.bz2">2014.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6873,7 +6873,7 @@
 	  <a href="/downloads/buildroot-2014.08-rc1.tar.bz2">2014.08-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6914,7 +6914,7 @@
 	  <a href="/downloads/buildroot-2014.05-rc3.tar.bz2">2014.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6937,7 +6937,7 @@
 	  <a href="/downloads/buildroot-2014.05-rc2.tar.bz2">2014.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -6960,7 +6960,7 @@
 	  <a href="/downloads/buildroot-2014.05-rc1.tar.bz2">2014.05-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7000,7 +7000,7 @@
 	  <a href="/downloads/buildroot-2014.02-rc3.tar.bz2">2014.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7022,7 +7022,7 @@
 	  <a href="/downloads/buildroot-2014.02-rc2.tar.bz2">2014.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7045,7 +7045,7 @@
 	  <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
 	    release candidate</a>, and report any problems found to the
 	  <a href="support.html">mailing list</a> or
-	  <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7148,7 +7148,7 @@
 	  <a href="/downloads/buildroot-2013.11-rc3.tar.bz2">2013.11-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7170,7 +7170,7 @@
 	  <a href="/downloads/buildroot-2013.11-rc2.tar.bz2">2013.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7227,7 +7227,7 @@
 	  <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7331,7 +7331,7 @@
 	  <a href="/downloads/buildroot-2013.08-rc3.tar.bz2">2013.08-rc3
 	    release candidate</a>, and report any problems found to the <a
 									   href="support.html">mailing list</a> or <a
-														      href="https://bugs.uclibc.org">bug tracker</a>.</p>
+														      href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7353,7 +7353,7 @@
 	  <a href="/downloads/buildroot-2013.08-rc2.tar.bz2">2013.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7375,7 +7375,7 @@
 	  <a href="/downloads/buildroot-2013.08-rc1.tar.bz2">2013.08-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7416,7 +7416,7 @@
 	  <a href="/downloads/buildroot-2013.05-rc3.tar.bz2">2013.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7438,7 +7438,7 @@
 	  <a href="/downloads/buildroot-2013.05-rc2.tar.bz2">2013.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7461,7 +7461,7 @@
 	  <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7501,7 +7501,7 @@
 	  <a href="/downloads/buildroot-2013.02-rc3.tar.bz2">2013.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7523,7 +7523,7 @@
 	  <a href="/downloads/buildroot-2013.02-rc2.tar.bz2">2013.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7546,7 +7546,7 @@
 	  <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7652,7 +7652,7 @@
 	  <a href="/downloads/buildroot-2012.11-rc2.tar.bz2">2012.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7675,7 +7675,7 @@
 	  <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7740,7 +7740,7 @@
 	  <a href="/downloads/buildroot-2012.08-rc3.tar.bz2">2012.08-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7762,7 +7762,7 @@
 	  <a href="/downloads/buildroot-2012.08-rc2.tar.bz2">2012.08-rc2
 	    release candidate</a>, and report any problems found to the <a
 									   href="support.html">mailing list</a> or <a
-														      href="https://bugs.uclibc.org">bug tracker</a>.</p>
+														      href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7784,7 +7784,7 @@
 	  <a href="/downloads/buildroot-2012.08-rc1.tar.bz2">2012.08-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7849,7 +7849,7 @@
 	  <a href="/downloads/buildroot-2012.05-rc3.tar.bz2">2012.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7871,7 +7871,7 @@
 	  <a href="/downloads/buildroot-2012.05-rc2.tar.bz2">2012.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7894,7 +7894,7 @@
 	  <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7958,7 +7958,7 @@
 	  <a href="/downloads/buildroot-2012.02-rc3.tar.bz2">2012.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -7980,7 +7980,7 @@
 	  <a href="/downloads/buildroot-2012.02-rc2.tar.bz2">2012.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8003,7 +8003,7 @@
 	  <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">2012.02-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8062,7 +8062,7 @@
 	  <a href="/downloads/buildroot-2011.11-rc3.tar.bz2">2011.11-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8084,7 +8084,7 @@
 	  <a href="/downloads/buildroot-2011.11-rc2.tar.bz2">2011.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8107,7 +8107,7 @@
 	  <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8146,7 +8146,7 @@
 	  <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8169,7 +8169,7 @@
 	  <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8207,7 +8207,7 @@
 	  <a href="/downloads/buildroot-2011.05-rc2.tar.bz2">2011.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8230,7 +8230,7 @@
 	  <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8270,7 +8270,7 @@
 	  <a href="/downloads/buildroot-2011.02-rc2.tar.bz2">2011.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8293,7 +8293,7 @@
 	  <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8333,7 +8333,7 @@
 	  <a href="/downloads/buildroot-2010.11-rc2.tar.bz2">2010.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8356,7 +8356,7 @@
 	  <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8419,7 +8419,7 @@
 	  <a href="/downloads/buildroot-2010.08-rc2.tar.bz2">2010.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
 
 	This is very much expected to be the final release candidate,
 	so give it a good test and expect a final 2010.08 release
@@ -8445,7 +8445,7 @@
 	  <a href="/downloads/buildroot-2010.08-rc1.tar.bz2">2010.08-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8485,7 +8485,7 @@
 	  <a href="/downloads/buildroot-2010.05-rc3.tar.bz2">2010.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8505,7 +8505,7 @@
 	  <a href="/downloads/buildroot-2010.05-rc2.tar.bz2">2010.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8527,7 +8527,7 @@
 	  <a href="/downloads/buildroot-2010.05-rc1.tar.bz2">2010.05-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8584,7 +8584,7 @@
 	  <a href="/downloads/buildroot-2010.02-rc2.tar.bz2">2010.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8606,7 +8606,7 @@
 	  <a href="/downloads/buildroot-2010.02-rc1.tar.bz2">2010.02-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8646,7 +8646,7 @@
 	  <a href="/downloads/buildroot-2009.11-rc2.tar.bz2">2009.11-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8668,7 +8668,7 @@
 	  <a href="/downloads/buildroot-2009.11-rc1.tar.bz2">2009.11-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8740,7 +8740,7 @@
 	  <a href="/downloads/buildroot-2009.08-rc3.tar.bz2">2009.08-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8761,7 +8761,7 @@
 	  <a href="/downloads/buildroot-2009.08-rc2.tar.bz2">2009.08-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8783,7 +8783,7 @@
 	  <a href="/downloads/buildroot-2009.08-rc1.tar.bz2">2009.08-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8825,7 +8825,7 @@
 	  <a href="/downloads/buildroot-2009.05-rc3.tar.bz2">2009.05-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8848,7 +8848,7 @@
 	  <a href="/downloads/buildroot-2009.05-rc2.tar.bz2">2009.05-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8890,7 +8890,7 @@
 	  <a href="/downloads/buildroot-2009.05-rc1.tar.bz2">2009.05-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8970,7 +8970,7 @@
 	  <a href="/downloads/buildroot-2009.02-rc4.tar.bz2">2009.02-rc4
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -8992,7 +8992,7 @@
 	  <a href="/downloads/buildroot-2009.02-rc3.tar.bz2">2009.02-rc3
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -9012,7 +9012,7 @@
 	  <a href="/downloads/buildroot-2009.02-rc2.tar.bz2">2009.02-rc2
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>.</p>
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
       </div>
     </div>
   </li>
@@ -9035,7 +9035,7 @@
 	  <a href="/downloads/buildroot-2009.02-rc1.tar.bz2">2009.02-rc1
 	    release candidate</a>, and report any problems found to
 	  the <a href="support.html">mailing list</a>
-	  or <a href="https://bugs.uclibc.org">bug tracker</a>. The
+	  or <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>. The
 	  plan is to release 2009.02 in time
 	  for <a href="http://www.fosdem.org/2009/">FOSDEM</a>.</p>
       </div>
@@ -9077,7 +9077,7 @@
 
 	<p>If you find a bug in buildroot, or wish to submit a patch
 	  to fix a problem or add a shiny new feature, please use
-	  the <a href="https://bugs.uclibc.org/">Bug and Patch
+	  the <a href="https://gitlab.com/buildroot.org/buildroot/-/issues/">Bug and Patch
 	  Tracking System</a> to post the details, to make certain
 	  your work is not lost</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
