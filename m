Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29DAEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C6560F37;
	Sat,  1 Jul 2023 14:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C6560F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luvG2ZZf6fU0; Sat,  1 Jul 2023 14:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F7660EF2;
	Sat,  1 Jul 2023 14:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F7660EF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B30E61BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D35B40A73
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D35B40A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGwBOO-cHbGB for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B938C40003
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B938C40003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A311185B77; Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 15:23:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af87ad197caf434936fe239f2718fd17b60fcb8b
X-Git-Newrev: 1b838496f942e862f6283028cdf3123015d0664d
X-Patchwork-Hint: ignore
Message-Id: <20230701140030.A311185B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmd: bump version to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b838496f942e862f6283028cdf3123015d0664d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://archive.hadrons.org/software/libmd/libmd-1.1.0.announce

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmd/libmd.hash | 5 +++--
 package/libmd/libmd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmd/libmd.hash b/package/libmd/libmd.hash
index 1a3c9d80df..7174b270ae 100644
--- a/package/libmd/libmd.hash
+++ b/package/libmd/libmd.hash
@@ -1,5 +1,6 @@
-# From https://lists.freedesktop.org/archives/libbsd/2021-October/000311.html
-sha512  731553ecc5e0e1eb228cced8fccd531fe31fb5c7627ca30013d287e1aeb8222959cf7498fbb7414bbabb967b25d4e8b0edd54fc47f6ccf55fc91087db0725ce3  libmd-1.0.4.tar.xz
+# From https://archive.hadrons.org/software/libmd/libmd-1.1.0.announce
+sha256  1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332  libmd-1.1.0.tar.xz
+sha512  5d0da3337038e474fae7377bbc646d17214e72dc848a7aadc157f49333ce7b5ac1456e45d13674bd410ea08477c6115fc4282fed6c8e6a0bf63537a418c0df96  libmd-1.1.0.tar.xz
 
 # Hash for license file
 sha256  4365ef6255ad553fce69dd4bc0e093472c5d0e41b8ea493a545cc926ce171aa6  COPYING
diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
index 19a2458982..8bbebc1bf1 100644
--- a/package/libmd/libmd.mk
+++ b/package/libmd/libmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMD_VERSION = 1.0.4
+LIBMD_VERSION = 1.1.0
 LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
 LIBMD_SITE = https://archive.hadrons.org/software/libmd
 LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
