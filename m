Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7AEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C3F417E2;
	Thu,  6 Jul 2023 08:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51C3F417E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXqssoAlAhWs; Thu,  6 Jul 2023 08:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288404007C;
	Thu,  6 Jul 2023 08:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 288404007C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0A01BF97F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E481840237
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E481840237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qE5ZrqLSzo9L for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED8F4417FA
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED8F4417FA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD53B867CC; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:47:35 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 945555e7ffd4eda1c8293a7bf8545c89361b8642
X-Git-Newrev: 0605f6d05d9412883b09fadeda0c991a24798cdb
X-Patchwork-Hint: ignore
Message-Id: <20230706085635.DD53B867CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libxslt: bump to
 version 1.1.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=0605f6d05d9412883b09fadeda0c991a24798cdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.news

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6794f14d485dbfd93ef167ba46d24e7095003729)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index c771e1fd7e..458c1388d3 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.37.sha256sum
-sha256  3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4  libxslt-1.1.37.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.sha256sum
+sha256  1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1  libxslt-1.1.38.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 95b0325c94..ec066fbfa2 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.37
+LIBXSLT_VERSION = 1.1.38
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
