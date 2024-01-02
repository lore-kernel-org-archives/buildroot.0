Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681CFC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CC5A40A7B;
	Tue,  2 Jan 2024 20:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC5A40A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0a7GlQ_jvIh; Tue,  2 Jan 2024 20:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3048A40A5B;
	Tue,  2 Jan 2024 20:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3048A40A5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE0381BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4A460DA5
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC4A460DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqkPfWj7nDTf for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C174360F93
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C174360F93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE59182AD1; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:09:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cd52a4d8127f31d8e8900c14e90f4bb9634ba11
X-Git-Newrev: 39a2e7b219ec87e380004ec3f3795652872b9553
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.BE59182AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/orc: bump to version 0.4.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=39a2e7b219ec87e380004ec3f3795652872b9553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.34/RELEASE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/orc/orc.hash | 4 ++--
 package/orc/orc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 136fc3ece4..1e584c1190 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.33.tar.xz.sha256sum
-sha256  844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a  orc-0.4.33.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.34.tar.xz.sha256sum
+sha256  8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f  orc-0.4.34.tar.xz
 
 # Locally calculated
 sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index be718e6f85..b2d2bb461b 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.33
+ORC_VERSION = 0.4.34
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
