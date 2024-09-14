Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE4FC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E34A80C97;
	Sun, 15 Sep 2024 21:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqV932yoLEZp; Sun, 15 Sep 2024 21:37:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DFF817AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2DFF817AE;
	Sun, 15 Sep 2024 21:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 251271BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A26A840A19
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXagMW0WCQD2 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99699400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99699400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 832AA83682; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:07:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31ead1c082e6e75424e25707024cafa28806a381
X-Git-Newrev: 977252a2fd6fc890f1fe76ecf72b70b68ae5d443
X-Patchwork-Hint: ignore
Message-Id: <20240915213636.832AA83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: bump to version 0.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=977252a2fd6fc890f1fe76ecf72b70b68ae5d443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release which includes cleanups to the game controller database,
and the ability to map more gamepad and joystick controls, and honorig
user mappings.

Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/508df238f9c25a20c0d06da8c9bf83138759d40f/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index b1da3c19f6..3653d672de 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.7.sha256sum
-sha256  cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51  libmanette-0.2.7.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.9.sha256sum
+sha256  29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f  libmanette-0.2.9.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 42fb479795..7872c8b796 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).7
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).9
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
