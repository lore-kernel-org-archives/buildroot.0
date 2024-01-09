Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B26C4707B
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 471EB4175A;
	Tue,  9 Jan 2024 20:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 471EB4175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y96q5x05K_NQ; Tue,  9 Jan 2024 20:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBC141723;
	Tue,  9 Jan 2024 20:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBC141723
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A80C1BF255
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 135B981F05
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135B981F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fp2rNj_bQ6HD for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 20:31:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51DA081F37
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 20:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51DA081F37
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EAD38516B; Tue,  9 Jan 2024 20:31:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 21:22:23 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5a803337de1238c9471905865de2bfa895ca1a98
X-Git-Newrev: be8bd8743d7dc2747b19141ce64c47651cdd8bae
X-Patchwork-Hint: ignore
Message-Id: <20240109203105.3EAD38516B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/dbus: bump to
 version 1.14.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=be8bd8743d7dc2747b19141ce64c47651cdd8bae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit be24c10472666d9dbfa12668c9326bc0bc9598b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 638bb4bc6f..a06ba50ccd 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35  dbus-1.14.8.tar.xz
+sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
 
 # Locally calculated
 sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 930b1a298b..c41fbcb4dd 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.14.8
+DBUS_VERSION = 1.14.10
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
