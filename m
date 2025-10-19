Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB26CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7756E8107F;
	Sun, 19 Oct 2025 19:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZR8YvmYsSC6; Sun, 19 Oct 2025 19:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DEE8108A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96DEE8108A;
	Sun, 19 Oct 2025 19:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 462661CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3846180F55
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AhJX_ZR8HEH for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D9780EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64D9780EBA
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53D668765F; Sun, 19 Oct 2025 19:38:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:37:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c531fe65209defd356e5ee8142896478a20ab371
X-Git-Newrev: f2966f065a465c34f322abd3092a3b42a3eb08fb
X-Patchwork-Hint: ignore
Message-Id: <20251019193850.53D668765F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-glib: bump to version 1.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2966f065a465c34f322abd3092a3b42a3eb08fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.8.news

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index c4381fc0d7..6ac9814c10 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
-sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.8.sha256sum
+sha256  55c5c141a564245b8f8fbe7698663c87a45a7333c2a2c56f06f811ab73b212dd  json-glib-1.10.8.tar.xz
 
 # Hashes for license files
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 9595c17274..c99a3e666d 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 1.10
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).8
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+, MIT (conformance test data), CC0-1.0 (parts of build system, metadata, translations)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
