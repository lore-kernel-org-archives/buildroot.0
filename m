Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83070C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481406103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 481406103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231E2837C4;
	Fri, 22 Oct 2021 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHdzG66T09_y; Fri, 22 Oct 2021 18:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701F683916;
	Fri, 22 Oct 2021 18:51:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D33A1C1127
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D14C60619
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26aWW66cI6eA for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9445D60636
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F018884A4; Fri, 22 Oct 2021 18:46:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:47:53 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 13d499c3b01aaceecf6f3536c9683cf03bad8b4d
X-Git-Newrev: 0bfff7d2446b917a1342a02973a402b9f2f82e0f
X-Patchwork-Hint: ignore
Message-Id: <20211022184640.1F018884A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libva: bump
 version to 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bfff7d2446b917a1342a02973a402b9f2f82e0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Release notes: https://github.com/intel/libva/releases/tag/2.13.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce4da37693747dd1ffad3ef988ef243eabb38d61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index b6531b2c57..7b66a7709d 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.12.0/libva-2.12.0.tar.bz2.sha1sum
-sha1  9704197d1d909d727f2e180672d287070576a923  libva-2.12.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.13.0/libva-2.13.0.tar.bz2.sha1sum
+sha1  2adb2c023371dd68fe0d23e58afcf0b072b79828  libva-2.13.0.tar.bz2
 # Locally computed
-sha256  d3f4873715077a8c969c9bfe4ba8455a133353176be0ffe0c41ffd4155c9a8c8  libva-2.12.0.tar.bz2
+sha256  fad383f39f36115814bd0eda1496a4cc01761643bd962635400df2d4470ad460  libva-2.13.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 70cf4fee91..6ac5386540 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.12.0
+LIBVA_VERSION = 2.13.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
