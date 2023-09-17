Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA1BCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988C4610EE;
	Sun, 17 Sep 2023 12:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988C4610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TElo0ZXtIX64; Sun, 17 Sep 2023 12:38:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D45606110F;
	Sun, 17 Sep 2023 12:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45606110F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F28CA1BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81DF8610F3
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81DF8610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_1iUpxDLIzO for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 966FA610EB
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966FA610EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 825F08713C; Sun, 17 Sep 2023 12:37:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:35:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9165262aa0486d9cf9bb1b8a2065e2616439c513
X-Git-Newrev: 4e365d1768b9f1b47634ea4ff46481df32299054
X-Patchwork-Hint: ignore
Message-Id: <20230917123755.825F08713C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcl: bump to version 8.6.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e365d1768b9f1b47634ea4ff46481df32299054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.13/tcltk-release-notes-8.6.13.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 2b82a1938b..109ea3d79c 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
+sha256  43a1fae7412f61ff11de2cfd05d28cfc3a73762f354a417c62370a54e2caf066  tcl8.6.13-src.tar.gz
 sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 97754b63d0..843d58a4ae 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).12
+TCL_VERSION = $(TCL_VERSION_MAJOR).13
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
