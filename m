Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722C0ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089A841937;
	Wed, 21 Sep 2022 18:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089A841937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nu0O9H-rLnG; Wed, 21 Sep 2022 18:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94D841852;
	Wed, 21 Sep 2022 18:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94D841852
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E75F41C1148
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D025C408FB
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D025C408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fw3ovSxV1uFc for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1155A4014B
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1155A4014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F38EB85C42; Wed, 21 Sep 2022 18:09:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 20:08:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ed98cf40ab6354d813ac6e194628b10a85f978a
X-Git-Newrev: a7a2b78da930fe445e2daac7782b3ffbc4b6a456
X-Patchwork-Hint: ignore
Message-Id: <20220921180907.F38EB85C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.96.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a2b78da930fe445e2daac7782b3ffbc4b6a456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sources are now hosted on github

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 7318c608c1..9649e24f7f 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c  lsof_4.95.0.linux.tar.bz2
+sha256  2753fc01452a3d2ee665e8365afdac0e9683197f3ec06231aa684a48b286d11c  lsof-4.96.3.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 21a327b996..8c8c46c4ed 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.95.0
-LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
-LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
+LSOF_VERSION = 4.96.3
+LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
