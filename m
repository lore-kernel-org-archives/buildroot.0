Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01F7C6FA93
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5455082EF0;
	Wed, 21 Sep 2022 18:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5455082EF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l21JJlHrWz2W; Wed, 21 Sep 2022 18:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AA8824A4;
	Wed, 21 Sep 2022 18:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AA8824A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E616A1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1D1E60F39
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D1E60F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPkTl3798_KD for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00A5E60681
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00A5E60681
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEFFD85C3E; Wed, 21 Sep 2022 18:09:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 20:08:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a582d1ecabda59b9ae5d9a9b6efe7fc4ac461183
X-Git-Newrev: 6f86172ca8d70cac3cece1431e771bbfd9a8db5c
X-Patchwork-Hint: ignore
Message-Id: <20220921180907.DEFFD85C3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libatomic_ops: bump to version
 7.6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f86172ca8d70cac3cece1431e771bbfd9a8db5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libatomic_ops/libatomic_ops.hash | 4 ++--
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 991c3fbe80..32a0795a5a 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  18091d5f3cb7008b0432016390ff437b9d1d76c10b92c8e63ff63f0c1331b030  libatomic_ops-7.6.12.tar.gz
-sha256  f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
+sha256  b4b0072bdb6780e2331db4fadba7e423fde25c71b1f0eb04859cc1eba59c2c2c  libatomic_ops-7.6.14.tar.gz
+sha256  636c2bf07975765ab9aff17f7c9b6beb9540378f45b5a1b21691d14ea804f0ff  doc/LICENSING.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index fb1e86f6bc..1b34d3b788 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.12
+LIBATOMIC_OPS_VERSION = 7.6.14
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
