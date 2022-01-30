Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8200EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053E960BD5;
	Sun, 30 Jan 2022 14:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwkserZPjXNy; Sun, 30 Jan 2022 14:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466D860B27;
	Sun, 30 Jan 2022 14:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1321BF95D
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3432F8317B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENe3sri3jVHP for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 726DE8315C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:12:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C5D9F82A52; Sun, 30 Jan 2022 14:05:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 14:53:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0623d12244ae40a25603958ff6f4ee9d2db31698
X-Git-Newrev: 8aa81ad9f129f8aa3ccd5bdb1207c0ecc3de147a
X-Patchwork-Hint: ignore
Message-Id: <20220130140530.C5D9F82A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: bump to version 1.26.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8aa81ad9f129f8aa3ccd5bdb1207c0ecc3de147a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bug-fix release.

See: https://www.enlightenment.org/news/2022-01-03-efl-1.26.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 6364d276c0..8d50400eb7 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://www.enlightenment.org/news/2021-12-26-efl-1.26.0
-sha256  a4a9bce45fd27f8541874e44a130f64550bee1f2f72feaa6c8a758d92eaf204c  efl-1.26.0.tar.xz
+# From https://www.enlightenment.org/news/2022-01-03-efl-1.26.1
+sha256  86a9677e3d48dd0c13a399ebb417bd417bd8d150d6b06cc491bc92275c88a642  efl-1.26.1.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ed0a8acc1d..43a2dc4fcb 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.26.0
+EFL_VERSION = 1.26.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
