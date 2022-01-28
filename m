Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12B841C8F;
	Fri, 28 Jan 2022 21:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGFz5gMkDWnk; Fri, 28 Jan 2022 21:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E623941616;
	Fri, 28 Jan 2022 21:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 426261BF5DC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF07884C8E
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-acQ2d0EZjK for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F81A84C75
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3DB4482964; Fri, 28 Jan 2022 21:01:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:50:04 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 43df60902ce19c3d8f71857be757a8997b9d53ca
X-Git-Newrev: 19bfe48a265e8dea3a2f18b24a70435470c48d08
X-Patchwork-Hint: ignore
Message-Id: <20220128210100.3DB4482964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gst1-interpipe:
 bump version to 1.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=19bfe48a265e8dea3a2f18b24a70435470c48d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog (since 1.1.7):

  8b70f08 Add definition of new event GstAppSinkCallbacks for interpipesink element
  ddaa9b5 Add conditional build according to GST_VERSION_MINOR
  730dea6 Bump project version
  8718b12 Add initialization for the GstAppSinkCallbacks struct
  f015ff7 Remove redundant initialization of new_event callback
  530da92 Update copyright year in README file
  e8ce826 Add explanatory comment on the memset of GstAppSinkCallbacks struct
  f0f3b8e Fix README copyright date to 2016-2022
  814982e Merge branch 'hotfix/add-new-event-callback'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0872ac72b79439a0106768ae2b58e824e1f316da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 348abdb003..d9f09d2985 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  0fd29d3cba623163dd5852989d7ca21eee9033da9d14a467ccd5e527e3b4297b  gst1-interpipe-1.1.7-br1.tar.gz
+sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index fa4485e6f8..cec23e7fa7 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.7
+GST1_INTERPIPE_VERSION = v1.1.8
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
