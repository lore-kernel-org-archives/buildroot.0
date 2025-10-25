Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A546CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A206081F;
	Sat, 25 Oct 2025 17:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UB3238NxXQBO; Sat, 25 Oct 2025 17:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C03460A3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C03460A3F;
	Sat, 25 Oct 2025 17:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF98BD7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A654A60A54
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Foxb0ySe2-wJ for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD5B26081F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD5B26081F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBFD1877DB; Sat, 25 Oct 2025 17:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 18:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2726d965cdaa28c7c21929f4b0aff431304e5e3e
X-Git-Newrev: 968cf34ad6f811c96d7ecedfd1aa774d6cde6ce3
X-Patchwork-Hint: ignore
Message-Id: <20251025171622.CBFD1877DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=968cf34ad6f811c96d7ecedfd1aa774d6cde6ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.freedesktop.org/glvnd/libglvnd/-/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libglvnd/libglvnd.hash | 2 +-
 package/libglvnd/libglvnd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
index e463a8def5..a1a3f2614a 100644
--- a/package/libglvnd/libglvnd.hash
+++ b/package/libglvnd/libglvnd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a884503d2412dc1fa209613aa8a77193aeb7065b823fe1775dc8b6f3e45211  libglvnd-1.4.0.tar.gz
+sha256  13ae5bb99a5a2869fbe00aadb49b21fd9c13dfbf59844b0f88d521098094d44a  libglvnd-1.7.0.tar.gz
 
 # Locally computed hashes for license files
 sha256  f84a3eca98cc5bdf5318741124c38c5e877f856df8c7e229ee5065e5c61038c2  README.md
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 95ac19dd91..6e375e2e63 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLVND_VERSION = 1.4.0
-LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/ca5bf4295beb39bb324f692c481ac8a1
+LIBGLVND_VERSION = 1.7.0
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/c24806c283070dc70700234ca8ffacf8
 
 LIBGLVND_LICENSE = \
 	libglvnd license, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
