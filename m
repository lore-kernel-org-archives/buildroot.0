Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459D9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D4760BDB;
	Sun,  9 Jan 2022 20:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlCT3TJpxDih; Sun,  9 Jan 2022 20:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2AD60BD6;
	Sun,  9 Jan 2022 20:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9CF1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CC714077D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5DQupAluj79 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:23:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12C5D40289
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CD73382B94; Sun,  9 Jan 2022 20:17:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:17:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba2016dc04271844416088b766284f9a22a6b58d
X-Git-Newrev: e5c69dc19fb0f6c7aabadb6700dac527304f54a4
X-Patchwork-Hint: ignore
Message-Id: <20220109201729.CD73382B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: bump to version 7.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5c69dc19fb0f6c7aabadb6700dac527304f54a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/libvirt/libvirt/-/blob/v7.10.0/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/libvirt.hash | 2 +-
 package/libvirt/libvirt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
index e8cbb34e2a..de9ebff564 100644
--- a/package/libvirt/libvirt.hash
+++ b/package/libvirt/libvirt.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  1b616099c18d14b9424a622f2a0bd3e0cfa286414f3416bd1a8173621b2252b2  libvirt-7.7.0.tar.xz
+sha256  cb318014af097327928c6e3d72922e3be02a3e6401247b2aa52d9ab8e0b480f9  libvirt-7.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 816bb0760d..7b0ed5e52e 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIRT_VERSION = 7.7.0
+LIBVIRT_VERSION = 7.10.0
 LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
