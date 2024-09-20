Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3444CF58E4
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 07:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D43414DB;
	Fri, 20 Sep 2024 07:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LcTCJZ_60Gi; Fri, 20 Sep 2024 07:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 927A741352
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 927A741352;
	Fri, 20 Sep 2024 07:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFA091BF82C
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC59084BDC
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjfY4ppFOiZ5 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5385884BD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5385884BD8
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41A2883E6F; Fri, 20 Sep 2024 07:53:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 09:35:45 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 0b0c59a4d015affee54a6af4efb4ea0894e08a12
X-Git-Newrev: 4a161d729bae688fd577e7754815b6e1ccf82f9d
X-Patchwork-Hint: ignore
Message-Id: <20240920075330.41A2883E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/genpart: change
 homepage and download location
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a161d729bae688fd577e7754815b6e1ccf82f9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The old homepage is no more, and the download location has changed.
Update both to the new download location.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 629c6254ce158f3a15f11149a65066473c17fbd9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genpart/Config.in      | 2 +-
 package/genpart/Config.in.host | 2 +-
 package/genpart/genpart.mk     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genpart/Config.in b/package/genpart/Config.in
index 64288452ea..b8b8c16f66 100644
--- a/package/genpart/Config.in
+++ b/package/genpart/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_GENPART
 	  line arguments and dump it to stdout. No CHS magic is done,
 	  only lba entries are filled out.
 
-	  http://www.pengutronix.de/software/genpart/index_en.html
+	  https://public.pengutronix.de/software/genpart
diff --git a/package/genpart/Config.in.host b/package/genpart/Config.in.host
index d8b9eb61b0..f821bc9e8b 100644
--- a/package/genpart/Config.in.host
+++ b/package/genpart/Config.in.host
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HOST_GENPART
 	  line arguments and dump it to stdout. No CHS magic is done,
 	  only lba entries are filled out.
 
-	  http://www.pengutronix.de/software/genpart/index_en.html
+	  https://public.pengutronix.de/software/genpart
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index 2aa2c710c0..b48a0ac358 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -6,7 +6,7 @@
 
 GENPART_VERSION = 1.0.2
 GENPART_SOURCE = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE = http://www.pengutronix.de/software/genpart/download
+GENPART_SITE = https://public.pengutronix.de/software/genpart
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
