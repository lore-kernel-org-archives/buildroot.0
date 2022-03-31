Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64069C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB8E83ED4;
	Thu, 31 Mar 2022 06:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UnS29Kgsr5D; Thu, 31 Mar 2022 06:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9B483ECF;
	Thu, 31 Mar 2022 06:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECEA11C115D
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7BA60D7F
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9xLq_j-q3NO for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18F0460E85
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:51:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9118386016; Thu, 31 Mar 2022 06:41:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 08:46:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 33951d7933c3162265cc44acfa0de7a61a5752f0
X-Git-Newrev: 9820d4903ea09a5640ed9bad83385243c3528eaa
X-Patchwork-Hint: ignore
Message-Id: <20220331064151.9118386016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jack2: bump to
 version 1.9.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=9820d4903ea09a5640ed9bad83385243c3528eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix URL for 'JACK DBus packaging' GitHub Wiki page.

https://github.com/jackaudio/jack2/releases/tag/v1.9.18
https://github.com/jackaudio/jack2/releases/tag/v1.9.19
https://github.com/jackaudio/jack2/releases/tag/v1.9.20

Signed-off-by: Jan Havran <jan.havran@audified.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 26ca7fec041836c31f29c5566365fe40eb552bca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in  | 4 ++--
 package/jack2/jack2.hash | 2 +-
 package/jack2/jack2.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index bc883190d5..8abdda6376 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_JACK2_LEGACY
 	help
 	  Build and use jackd.
 
-	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 config BR2_PACKAGE_JACK2_DBUS
 	bool "dbus jack2"
@@ -42,7 +42,7 @@ config BR2_PACKAGE_JACK2_DBUS
 	help
 	  Build and use jackdbus.
 
-	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 endif
 
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index df708f7ca5..6361473cf7 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38f674bbc57852a8eb3d9faa1f96a0912d26f7d5df14c11005ad499c8ae352f2  jack2-1.9.17.tar.gz
+sha256  915ad2900992159bdb729b9fc4ea134b962ce32b2df0b384fee40a2c5808835d  jack2-1.9.20.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index e6a036bac9..2e55169984 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.17
+JACK2_VERSION = 1.9.20
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
