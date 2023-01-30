Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E91C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77CC3408EB;
	Mon, 30 Jan 2023 21:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CC3408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORjpZ9b6eL3F; Mon, 30 Jan 2023 21:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B316408A5;
	Mon, 30 Jan 2023 21:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B316408A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9D01BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB14D81BD4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB14D81BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXsyKhEEpE8a for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21A13818CD
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A13818CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CF398257C; Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:03:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c93db6789b1afaba27703baf9d323bcb06e6430e
X-Git-Newrev: 76152e95a9749d05c0e334e1fa6affdf9aeafb7f
X-Patchwork-Hint: ignore
Message-Id: <20230130211634.0CF398257C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: bump version to 2.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=76152e95a9749d05c0e334e1fa6affdf9aeafb7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/intel/libva/blob/v2.17-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2916898c31..700ace0378 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.16.0/libva-2.16.0.tar.bz2.sha1sum
-sha1  ba1c0e196d69a26e54b065dc0f645bdf3be147a7  libva-2.16.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.17.0/libva-2.17.0.tar.bz2.sha1sum
+sha1  997f7b3111bc5a4d32ec72e9d7f9fcfca41e4923  libva-2.17.0.tar.bz2
 # Locally computed
-sha256  115faca0db2c417a37da49830870e260450fa13066f5e24e252a20c36d920a1c  libva-2.16.0.tar.bz2
+sha256  f3e5eb27c305e05a9bb62703d1915a127301cc0c4f9f209025767432230c4eac  libva-2.17.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 3b6e9580d3..c6b9f63b10 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.16.0
+LIBVA_VERSION = 2.17.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
