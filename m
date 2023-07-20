Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA86EEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664586128E;
	Thu, 20 Jul 2023 21:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664586128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLXJI8_8OcEl; Thu, 20 Jul 2023 21:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D146129E;
	Thu, 20 Jul 2023 21:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D146129E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98C781BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7246041E2E
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7246041E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26pze5fY2HWt for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E54C41DB0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E54C41DB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 676FC8742E; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8291fde5ee19fd475953f41d9c519e817554d6b
X-Git-Newrev: 4c24761f77f18b53008201cb53cb0fdd82143103
X-Patchwork-Hint: ignore
Message-Id: <20230720211019.676FC8742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-eimp: bump version to 1.0.22
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c24761f77f18b53008201cb53cb0fdd82143103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/processone/eimp/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-eimp/erlang-eimp.hash | 2 +-
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index 5845815c60..26e8addd2d 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25e4e1178280d6fb98ee5e582ade393f7c5404c546638bcde86a6ebcb6757d90  erlang-eimp-1.0.21.tar.gz
+sha256  7023b86bc7cf3551fd876a1361ceb2443bdf1c1be9f98a4d9a9a90eda3353b51  erlang-eimp-1.0.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index 27bb2203c2..68d0d9e9ed 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.21
+ERLANG_EIMP_VERSION = 1.0.22
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
