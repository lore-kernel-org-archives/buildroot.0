Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C49C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694BB6100B;
	Tue, 21 Feb 2023 01:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 694BB6100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVtgPkdghenS; Tue, 21 Feb 2023 01:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07F961142;
	Tue, 21 Feb 2023 01:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07F961142
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE8B91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD14341821
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD14341821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8b-6g4leFbr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E99DA4182F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99DA4182F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E728A86496; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 22:10:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d782c0682f559d407e64698470b511512a5bdc78
X-Git-Newrev: 2ecaf26b5e3693cf0145a2d1fcc2e0953884baf4
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.E728A86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/poke: bump to version
 3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ecaf26b5e3693cf0145a2d1fcc2e0953884baf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See:
http://www.jemarch.net/poke-3.0-relnotes.html

Build tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/782116399

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poke/poke.hash | 2 +-
 package/poke/poke.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index 09dc4e8972..e6e436570c 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  841e285917c6738ce982a6930e30ebeadecfb0655a79d9184f16f876a9fe6e47  poke-2.4.tar.gz
+sha256  79a9b2f33c9f8c327c499afadaeeabfeecf6ad4988924d2c6c6f317e50317add  poke-3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index d49e628dbf..4a6ff344b2 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 2.4
+POKE_VERSION = 3.0
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
