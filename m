Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA0CD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F097F607CE;
	Mon,  1 Apr 2024 14:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm0lKJGofB-Z; Mon,  1 Apr 2024 14:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EE460833
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EE460833;
	Mon,  1 Apr 2024 14:30:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45F111BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 335814023F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdjsx38678ps for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FBBE40162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FBBE40162
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C58684555; Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 16:28:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc101babfd5fd36062b8c7551e41cace84192a70
X-Git-Newrev: 2a8b8e13062029ebfc1d4e43b789c5eb186bc36b
X-Patchwork-Hint: ignore
Message-Id: <20240401143015.5C58684555@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a8b8e13062029ebfc1d4e43b789c5eb186bc36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce:
https://lists.gnu.org/archive/html/bug-ed/2024-01/msg00000.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 007f645f51..5deb5e74ef 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html
-sha256  ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48  ed-1.19.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2024-01/msg00000.html
+sha256  c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6  ed-1.20.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index a90d1f005e..edfadf02a6 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.19
+ED_VERSION = 1.20
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
