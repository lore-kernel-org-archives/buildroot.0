Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 12:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36468817BA;
	Tue, 28 Dec 2021 12:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wje1lMo4ih_2; Tue, 28 Dec 2021 12:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A358E81355;
	Tue, 28 Dec 2021 12:58:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC2B1BF59C
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 866CC8136D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQ2rj6w7igN4 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D71EC80B6A
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7FF7982518; Tue, 28 Dec 2021 12:52:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 13:56:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6610c3f590381ac773fb95b6312fde560e341ce
X-Git-Newrev: d676c0e494ff75f00402f8bbd4afa90d27cea89b
X-Patchwork-Hint: ignore
Message-Id: <20211228125231.7FF7982518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigc: bump to version 3.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d676c0e494ff75f00402f8bbd4afa90d27cea89b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change license to LGPL-3.0+:
https://github.com/libsigcplusplus/libsigcplusplus/commit/8a231956bc0a8d9c5d0db59a3eaf4311ee36275f

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.0.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigc/libsigc.hash | 6 +++---
 package/libsigc/libsigc.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index d631185a41..97c9d0cc84 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.6.sha256sum
-sha256  dda176dc4681bda9d5a2ac1bc55273bdd381662b7a6d49e918267d13e8774e1b  libsigc++-2.10.6.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.0/libsigc++-3.0.7.sha256sum
+sha256  bfbe91c0d094ea6bbc6cbd3909b7d98c6561eea8b6d9c0c25add906a6e83d733  libsigc++-3.0.7.tar.xz
 
 # Locally calculated
-sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 6539fdbdb6..18be25fd03 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 2.10
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).6
+LIBSIGC_VERSION_MAJOR = 3.0
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).7
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_INSTALL_STAGING = YES
-LIBSIGC_LICENSE = LGPL-2.1+
+LIBSIGC_LICENSE = LGPL-3.0+
 LIBSIGC_LICENSE_FILES = COPYING
 LIBSIGC_CONF_OPTS = \
 	-Dbuild-examples=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
