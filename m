Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCF5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D04E9403A5;
	Mon, 28 Feb 2022 21:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9IRYsdhiT9t; Mon, 28 Feb 2022 21:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C1FC405E3;
	Mon, 28 Feb 2022 21:20:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABF3E1BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A884E60E6C
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYNhwLquBhAb for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC1D60E6B
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:20:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 18F1682655; Mon, 28 Feb 2022 21:12:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:18:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c4d496bf10675bacfdc1c0901c755e79f157699
X-Git-Newrev: 7af7acabe051c1b394f53fd02084be7b97d8a8d8
X-Patchwork-Hint: ignore
Message-Id: <20220228211234.18F1682655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: bump to version 1.12.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=7af7acabe051c1b394f53fd02084be7b97d8a8d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/dbus/dbus/-/blob/dbus-1.12.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 06512e5656..176396fe2f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.22.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe  dbus-1.12.20.tar.gz
+sha256  8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474  dbus-1.12.22.tar.gz
 
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d78e102427..de447d8680 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.20
+DBUS_VERSION = 1.12.22
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
