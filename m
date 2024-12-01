Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD9D4977B
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 17:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EA66F49B;
	Sun,  1 Dec 2024 17:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwRMglVMXgv2; Sun,  1 Dec 2024 17:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4EE86F50C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4EE86F50C;
	Sun,  1 Dec 2024 17:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF7DB60
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6FD66F50C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFwgqLLGlDj8 for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E783A6F49B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E783A6F49B
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D04B0867C7; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 16:04:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 47881d30dbf4977e8dd1ca54106fbb9aeaef8413
X-Git-Newrev: ae0e6d14d547c0d71cf68c75c821f4b2c1d367dd
X-Patchwork-Hint: ignore
Message-Id: <20241201174550.D04B0867C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxkbcommon: bump
 version to 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae0e6d14d547c0d71cf68c75c821f4b2c1d367dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien:
  - add new line before S-o-b
  - add missing space in hash file (fix "make check-package" error)
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index fff2b7a943..6cdd79e01a 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
-sha256  106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031  libxkbcommon-1.4.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html
+sha256  65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247  libxkbcommon-1.7.0.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 882791b917..c60580ef84 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.4.0
+LIBXKBCOMMON_VERSION = 1.7.0
 LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
