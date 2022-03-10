Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38327C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C2D6127A;
	Thu, 10 Mar 2022 21:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6QZRZo2yJHh; Thu, 10 Mar 2022 21:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC3F60B10;
	Thu, 10 Mar 2022 21:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35C3D1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B760361281
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlELY-QaY5j1 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D14FF60B43
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4491F83BFC; Thu, 10 Mar 2022 21:18:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:26:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b1003855b02f6d9c77de634c9d0f636470e7388
X-Git-Newrev: 4dc0576b49bc67922b5c136b78ae4072726eeb71
X-Patchwork-Hint: ignore
Message-Id: <20220310211844.4491F83BFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.110
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dc0576b49bc67922b5c136b78ae4072726eeb71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index ca7332dd76..e0fac3a4d1 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html
-sha256  629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26  libdrm-2.4.109.tar.xz
-sha512  45194bb28207421afcff3e247930d2eeab77a5fea58e6be22f67525f2e0aab2f410a9ae0ab315b55ef56b80c481bba40b1660468b7cda539758b2bbb8e814fd8  libdrm-2.4.109.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html
+sha256  eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737  libdrm-2.4.110.tar.xz
+sha512  52f92ef1fe4c218a1d7dba53ef43334dbfca80e3209afe59f3a32c4bf67473126534e990df07a931a12d46a3b997c21ef17c1c4d8a0c88d44d5c6c040e3b6be3  libdrm-2.4.110.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9b614bf421..b64db06931 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.109
+LIBDRM_VERSION = 2.4.110
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
