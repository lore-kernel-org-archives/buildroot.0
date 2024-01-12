Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E176AC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E40C60B12;
	Fri, 12 Jan 2024 16:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E40C60B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCUrBn_Ru6VE; Fri, 12 Jan 2024 16:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C35CD6FAEE;
	Fri, 12 Jan 2024 16:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C35CD6FAEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC0A1BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB117436FF
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB117436FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJDT5mjOV_h2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3E8340364
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3E8340364
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFD3585F02; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 17:26:26 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0aab578d487aae9b4bf9e54a8fe322720ad47d92
X-Git-Newrev: 12a5a21fee615eea17fe1e52c39a0566e242fd7c
X-Patchwork-Hint: ignore
Message-Id: <20240112163636.AFD3585F02@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/orc: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=12a5a21fee615eea17fe1e52c39a0566e242fd7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
