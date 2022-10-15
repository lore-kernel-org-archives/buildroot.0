Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3A7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF50441522;
	Sat, 15 Oct 2022 15:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF50441522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2lokVMel_Ag; Sat, 15 Oct 2022 15:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9046C414CD;
	Sat, 15 Oct 2022 15:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9046C414CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 334161BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B035414CC
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B035414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnnK3FsMjNJu for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9739410DB
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9739410DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5D4086DB9; Sat, 15 Oct 2022 15:37:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:31:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 956de5414111988fb2ea6ade373022b5a83baca7
X-Git-Newrev: 3223b8f5c1285516f088371888ed0315e3da52ab
X-Patchwork-Hint: ignore
Message-Id: <20221015153717.D5D4086DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: bump
 version to 9.16.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=3223b8f5c1285516f088371888ed0315e3da52ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d11c2dbb8fc1899571d6c8991b22b3ca1539c78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2c10a0429b..171edc8806 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.27/bind-9.16.27.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.31/bind-9.16.31.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  90902aaf104c81019d75d6f8b2f7ec40fcd249406f894b44e4a9c6b5e08bf566  bind-9.16.27.tar.xz
+sha256  8ca2cb6c37b605c70f7a25f0cf8a94d2040e025824db2341b92625efd96e7cfb  bind-9.16.31.tar.xz
 sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index bd12f7ad31..5e8d9d5033 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.27
+BIND_VERSION = 9.16.31
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
