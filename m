Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B660C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 12:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5330D40574;
	Tue, 28 Dec 2021 12:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jIeE7Kj3qVK; Tue, 28 Dec 2021 12:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93004051E;
	Tue, 28 Dec 2021 12:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E50ED1BF59C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2E54404F4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2MAuiwr_P8C for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E04E34024B
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8992B82BA5; Tue, 28 Dec 2021 12:52:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 13:56:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d676c0e494ff75f00402f8bbd4afa90d27cea89b
X-Git-Newrev: 164b022147ab394fd85742fe2e43c91d5787564d
X-Patchwork-Hint: ignore
Message-Id: <20211228125231.8992B82BA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairomm: bump to version 1.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=164b022147ab394fd85742fe2e43c91d5787564d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use gitlab to retrieve latest version
- Switch to meson-package as configure is not shipped anymore
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.16.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cairomm/cairomm.hash | 5 ++---
 package/cairomm/cairomm.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index 573104ec96..d14a65c2d6 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,4 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/cairomm/1.12/cairomm-1.12.0.sha256sum
-sha256	a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6	cairomm-1.12.0.tar.xz
 # Locally computed
-sha256 bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
+sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
+sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 07aae971d0..856c9d67fc 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-CAIROMM_VERSION_MAJOR = 1.12
-CAIROMM_VERSION = $(CAIROMM_VERSION_MAJOR).0
+CAIROMM_VERSION = 1.16.1
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
-CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
-CAIROMM_SITE = http://ftp.gnome.org/pub/gnome/sources/cairomm/$(CAIROMM_VERSION_MAJOR)
+CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
 CAIROMM_INSTALL_STAGING = YES
 CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
+CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
