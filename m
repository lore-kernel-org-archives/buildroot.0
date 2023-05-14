Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78FBC7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A2183BC2;
	Sun, 14 May 2023 12:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A2183BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUHomo_99Mxd; Sun, 14 May 2023 12:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A8283B9E;
	Sun, 14 May 2023 12:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A8283B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD6E91BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E1760E24
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E1760E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXWNWOO2k7yO for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9E3B60C17
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E3B60C17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A65E886681; Sun, 14 May 2023 12:32:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 14:27:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be6dfa537057b7f8c0f3a182ab418bdf275f3bcf
X-Git-Newrev: a5f500e1a728b632ccbff553475c0ee7d6c960bb
X-Patchwork-Hint: ignore
Message-Id: <20230514123207.A65E886681@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibmm: bump to version 2.76.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5f500e1a728b632ccbff553475c0ee7d6c960bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.76.0/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index ea256c3add..ee50ccdb01 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
-sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
+sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 7f37da8449..da95329a3d 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.68
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
+GLIBMM_VERSION_MAJOR = 2.76
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
