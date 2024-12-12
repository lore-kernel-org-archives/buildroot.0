Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3522E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D436FBEB;
	Thu, 12 Dec 2024 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24Twl1bfUDjv; Thu, 12 Dec 2024 21:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC1961427
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC1961427;
	Thu, 12 Dec 2024 21:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B27675
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4403B43354
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOXQoeSpcioo for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 514734357F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514734357F
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:17:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C22886DE9; Thu, 12 Dec 2024 21:17:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:02:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 918416bf9aa17417d965a64ddf09d0b4a8fa651b
X-Git-Newrev: a237ec1123b3343951980a750533e261e1f0e0d7
X-Patchwork-Hint: ignore
Message-Id: <20241212211739.9C22886DE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: bump to version 2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a237ec1123b3343951980a750533e261e1f0e0d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.1.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien: add change log link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 1350fc6781..1160f3f2bb 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  88af4569161a0d0192f0f4a94582a1af4e75722499d06984fb7f91f638f5afb3  sdbus-cpp-2.0.0.tar.gz
+sha256  6025e5dc6cddd532ff960d14e68ced5f42a1916b23a73fea6bcb437f06992eaf  sdbus-cpp-2.1.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 2994f079c9..a01bcd22c6 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.0.0
+SDBUS_CPP_VERSION = 2.1.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
