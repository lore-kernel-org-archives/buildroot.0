Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC65E60E6F;
	Sun, 27 Mar 2022 16:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5zrxBaj4yie; Sun, 27 Mar 2022 16:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD5E60AD0;
	Sun, 27 Mar 2022 16:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD7701BF9AA
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD53A40A7A
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09AVGWiJsiRU for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE7DA4090F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8B22485E92; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f11f6ab6e62cb04e33487390f0f0d66d9ed2d950
X-Git-Newrev: bc1ffa38ba7a47aea2b0ab5bb86e198607ee61b1
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.8B22485E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atk: bump to version 2.38.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc1ffa38ba7a47aea2b0ab5bb86e198607ee61b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/atk/-/tags/2.38.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 2e7c3b5fec..d8cd69ff1f 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.36/atk-2.36.0.sha256sum
-sha256  fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788  atk-2.36.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
+sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
 
 # Hash for license file
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index dfeb4de8b2..2820fb486d 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.36
+ATK_VERSION_MAJOR = 2.38
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
