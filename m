Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A41611C9;
	Sat, 16 Apr 2022 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLK2NP_mS_sP; Sat, 16 Apr 2022 20:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4084C611AF;
	Sat, 16 Apr 2022 20:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 589ED1BF484
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55365611C1
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvavLItp5XYd for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4329F611AF
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 19:59:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6BB7C83D24; Sat, 16 Apr 2022 19:49:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 21:58:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80c11958e6c2228686964c2d6f4e95273403888e
X-Git-Newrev: 130cfc74d7a273999a3e61100a75d8ac1acc3579
X-Patchwork-Hint: ignore
Message-Id: <20220416194957.6BB7C83D24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: update site
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

commit: https://git.buildroot.net/buildroot/commit/?id=130cfc74d7a273999a3e61100a75d8ac1acc3579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14751

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index c52eaee1e1..126748d339 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,4 +1,4 @@
-# From http://sources.redhat.com/pub/lvm2/sha512.sum
+# From https://sourceware.org/ftp/lvm2/sha512.sum
 sha512  6a93bed1d5cf36f0f48d4d413d028b0e480cd4fc20e25d173770a892f265d2a0cc68d01a720b1513469953649e989532cd0c45f9538f92a4190eb3dc4555857d  LVM2.2.03.14.tgz
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 89fdf2c1be..9caf99eb9b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -6,7 +6,7 @@
 
 LVM2_VERSION = 2.03.14
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE = http://sources.redhat.com/pub/lvm2
+LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
