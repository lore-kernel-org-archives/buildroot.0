Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438CC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4096D405AD;
	Sun, 14 Jul 2024 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TSZ_g0Y65XC; Sun, 14 Jul 2024 20:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC674405A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC674405A2;
	Sun, 14 Jul 2024 20:23:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 354D71BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8CD6064B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQMkYmHa3JkN for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1850B60627
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1850B60627
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0348D869A9; Sun, 14 Jul 2024 20:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 21:38:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9e0670f3cfbf9b66c868e38d5c5f9de44511dd6
X-Git-Newrev: 9dff6c7f48a719ec404a84b54be1e34cc3eb8919
X-Patchwork-Hint: ignore
Message-Id: <20240714202320.0348D869A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] execline: bump to version 2.9.6.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6846689827840282305=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6846689827840282305==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9dff6c7f48a719ec404a84b54be1e34cc3eb8919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 3f9ff8a138..76412978b9 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  df750035d0fb21c7265bffb7ed7e1b661de1e842944a2252bdcddc32d0d97217  execline-2.9.5.1.tar.gz
+sha256  ba2a27e97c5eb6bd7ca6a0987a8925e44465a5be996daa0d18f8feca37d7571a  execline-2.9.6.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index b3d2d98216..ee38d3ed3c 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.9.5.1
+EXECLINE_VERSION = 2.9.6.0
 EXECLINE_SITE = https://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING

--===============6846689827840282305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6846689827840282305==--
