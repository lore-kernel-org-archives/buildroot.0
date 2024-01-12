Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B48EC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B7B6FAFA;
	Fri, 12 Jan 2024 16:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1B7B6FAFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0z018yQj4NmN; Fri, 12 Jan 2024 16:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 203026FB19;
	Fri, 12 Jan 2024 16:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 203026FB19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFC41BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C89845E2
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C89845E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJoaWCECoDsD for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:40:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6C3084636
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C3084636
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D088785F16; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 17:26:32 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 466c72828cd5df58532cde21c3cfdac346e5dd70
X-Git-Newrev: dcc5fa2203a1fb0945578aa813daa55683b35582
X-Patchwork-Hint: ignore
Message-Id: <20240112164019.D088785F16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/orc: bump to
 version 0.4.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcc5fa2203a1fb0945578aa813daa55683b35582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.34/RELEASE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 39a2e7b219ec87e380004ec3f3795652872b9553)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
