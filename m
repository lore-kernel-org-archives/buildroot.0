Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A94AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24AB760EBD
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24AB760EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D5B402C2;
	Sun, 17 Oct 2021 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQ8dD6rqXzRg; Sun, 17 Oct 2021 09:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0EE40291;
	Sun, 17 Oct 2021 09:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D86D1BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7D96066A
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtxIqXlI6wqY for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6D8A605DE
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E107A95CB1; Sun, 17 Oct 2021 09:07:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 11:09:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e44b5fe79fbfe8bce995b6d4694060b721ea490
X-Git-Newrev: ce4da37693747dd1ffad3ef988ef243eabb38d61
X-Patchwork-Hint: ignore
Message-Id: <20211017090722.E107A95CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: bump version to 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce4da37693747dd1ffad3ef988ef243eabb38d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/intel/libva/releases/tag/2.13.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
