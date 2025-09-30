Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820E0CCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 573D884081;
	Wed,  1 Oct 2025 20:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJW7OZwArV9i; Wed,  1 Oct 2025 20:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1644684080
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1644684080;
	Wed,  1 Oct 2025 20:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E71DCC0
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CBDB411DF
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0NM9zQVwBKC for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6785F411F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6785F411F7
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 658D486441; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:21:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9faeb6e9a255ab6bbfe0fd72f11d84156c05c18b
X-Git-Newrev: 6b5555333770f67061130a7ebd76717396af247b
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.658D486441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: update old
 git links to proper gitlab location
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103556284196036814=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2103556284196036814==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b5555333770f67061130a7ebd76717396af247b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Some links are still pointing to git.buildroot.org, which is the old URL
for the official Buildroot git repository. The repository is now hosted
at gitlab.com. Update those old links accordingly.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3ae80441ed1e3e195f4d20f7f6ca331cfe750f2e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/contribute.adoc | 2 +-
 docs/manual/manual.adoc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index caecd09764..c17f1619b4 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -58,7 +58,7 @@ basically two things that can be done:
   these steps:
   . Check if you can reproduce the problem by building with the same
     configuration. You can do this manually, or use the
-    https://git.buildroot.org/buildroot-test/tree/utils/br-reproduce-build[br-reproduce-build]
+    https://gitlab.com/buildroot.org/buildroot-test/-/blob/master/utils/br-reproduce-build[br-reproduce-build]
     script that will automatically clone a Buildroot git repository,
     checkout the correct revision, download and set the right
     configuration, and start the build.
diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
index d4748c5c68..0682736136 100644
--- a/docs/manual/manual.adoc
+++ b/docs/manual/manual.adoc
@@ -9,7 +9,7 @@ Buildroot {sys:echo $BR2_VERSION} manual generated on {localdate}
 
 The Buildroot manual is written by the Buildroot developers.
 It is licensed under the GNU General Public License, version 2. Refer to the
-https://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
+https://gitlab.com/buildroot.org/buildroot/-/blob/master/COPYING[COPYING]
 file in the Buildroot sources for the full text of this license.
 
 Copyright (C) The Buildroot developers <buildroot@buildroot.org>

--===============2103556284196036814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2103556284196036814==--
