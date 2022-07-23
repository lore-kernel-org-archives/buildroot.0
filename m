Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01011C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939F64245F;
	Sat, 23 Jul 2022 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 939F64245F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18ioWQRz-F_j; Sat, 23 Jul 2022 20:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A169D42452;
	Sat, 23 Jul 2022 20:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A169D42452
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6126D1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A0B34048D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0B34048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F58aDjS97_0G for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:28:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D0F4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D0F4019C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D8223851CA; Sat, 23 Jul 2022 20:15:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:28:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e88cb1038d3a3691621d0fe14bc9f13d6c9b7389
X-Git-Newrev: 19ad2dd11a4c4ea8a495365aa704f61512863b0b
X-Patchwork-Hint: ignore
Message-Id: <20220723201520.D8223851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: bump to version 1.4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19ad2dd11a4c4ea8a495365aa704f61512863b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of README.md (extra paragraph removed with
  https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/a7bb6f4d19d1258d83c8800af885936a243e07bb)
- Update hash of uthash license (year updated with
  https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/b3a958feb03694e2f0df71482875684e45353964)

https://gitlab.freedesktop.org/glvnd/libglvnd/-/tags/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglvnd/libglvnd.hash | 6 +++---
 package/libglvnd/libglvnd.mk   | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
index 15e76ea9e8..e463a8def5 100644
--- a/package/libglvnd/libglvnd.hash
+++ b/package/libglvnd/libglvnd.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256  6332c27f4c792b09a3eb1d7ae18c2d6ff6a0acaf3a746489caf859e659fca2f7  libglvnd-v1.3.2.tar.gz
+sha256  c4a884503d2412dc1fa209613aa8a77193aeb7065b823fe1775dc8b6f3e45211  libglvnd-1.4.0.tar.gz
 
 # Locally computed hashes for license files
-sha256  224534547628a9e5e889d8808385bd38839e6bdb77d89c90ac04dad6891a4f5f  README.md
-sha256  bebdc0fd27cd37af8406e47af23c113866b7856c3f7349ffcbc672029ec8acf7  src/util/uthash/LICENSE
+sha256  f84a3eca98cc5bdf5318741124c38c5e877f856df8c7e229ee5065e5c61038c2  README.md
+sha256  e9b9aac8421b6d29176c6f23f6f7a907194245e35ef99ace10839734961cfaa2  src/util/uthash/LICENSE
 sha256  f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  src/util/cJSON/LICENSE
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 3bac4b31e2..95ac19dd91 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBGLVND_VERSION = 1.3.2
-LIBGLVND_SOURCE = libglvnd-v$(LIBGLVND_VERSION).tar.gz
-LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v$(LIBGLVND_VERSION)
+LIBGLVND_VERSION = 1.4.0
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/ca5bf4295beb39bb324f692c481ac8a1
 
 LIBGLVND_LICENSE = \
 	libglvnd license, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
