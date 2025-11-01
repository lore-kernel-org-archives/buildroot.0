Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7FFCCFA02
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 19:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB7A612F4;
	Sat,  1 Nov 2025 19:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ1d6wbJqEDa; Sat,  1 Nov 2025 19:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73860612F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73860612F9;
	Sat,  1 Nov 2025 19:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B53E2A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C70D413EE
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuP1hBn44KpD for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 19:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450EA413E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450EA413E4
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 19:46:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33E598386F; Sat,  1 Nov 2025 19:46:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Nov 2025 20:37:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 514b64d70a64a4c1ef663cdbd8d59433eeff051c
X-Git-Newrev: f11681ccd19f007b360593105d07a44afaac387d
X-Patchwork-Hint: ignore
Message-Id: <20251101194619.33E598386F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: bump to version 0.2.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f11681ccd19f007b360593105d07a44afaac387d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix version, the only changes listed in the release notes are updated
mappings in the controller database:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.13/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index dac0d3707e..f2974ca059 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.12.sha256sum
-sha256  48b349267180f1dc34d405a9e1e90ba16f054a19ce907930e679493d911ea1d8  libmanette-0.2.12.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.13.sha256sum
+sha256  287cc2fde0de092919366af757d85e7b3a0248eb1b395344726e97955a77d8ae  libmanette-0.2.13.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index b67f2cc086..c320b84840 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).12
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).13
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
