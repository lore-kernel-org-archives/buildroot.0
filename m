Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811EEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E7E44050C;
	Mon,  4 Apr 2022 17:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuPutI2guR65; Mon,  4 Apr 2022 17:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63BDF404CF;
	Mon,  4 Apr 2022 17:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A90561BF9AF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 990F082656
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sACaGuBgA3VU for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E0782605
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 65192803CB; Mon,  4 Apr 2022 17:31:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:35:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10d80eb39aed471b6c47400e1b155c94a61d8e61
X-Git-Newrev: 4e4739ca5a9315ae3be20bb11c75d6d88e32b2ff
X-Patchwork-Hint: ignore
Message-Id: <20220404173129.65192803CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e4739ca5a9315ae3be20bb11c75d6d88e32b2ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

license has been switched back to GPL-2.0+:
https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00002.html

https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ed/ed.hash | 6 +++---
 package/ed/ed.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 90d467d1f3..36f9b9c1e4 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html
-sha256  71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54  ed-1.17.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
+sha256  aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f  ed-1.18.tar.lz
 # Locally calculated
-sha256  f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c  COPYING
+sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 975cf3be10..645cfb7696 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ED_VERSION = 1.17
+ED_VERSION = 1.18
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
-ED_LICENSE = GPL-3.0+
+ED_LICENSE = GPL-2.0+
 ED_LICENSE_FILES = COPYING
 ED_CPE_ID_VENDOR = gnu
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
