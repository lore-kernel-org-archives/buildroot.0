Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DE5C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8C061046;
	Wed, 10 Jul 2024 21:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k84QfY5uBjYl; Wed, 10 Jul 2024 21:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B40C61045
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B40C61045;
	Wed, 10 Jul 2024 21:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABE7A1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96F0560850
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-p1_Sf1pgk1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16A7608A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16A7608A9
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:23:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC95E846F6; Wed, 10 Jul 2024 21:23:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:17:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 365ee4b6311f28bb5ee187bce90f27b9a758f280
X-Git-Newrev: cc9c09d18944c14b3544279adb72634128e9d004
X-Patchwork-Hint: ignore
Message-Id: <20240710212309.BC95E846F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-pico: bump version to
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc9c09d18944c14b3544279adb72634128e9d004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.11.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 9ea45969aa..3e017b79c8 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a5bc5cae6fd4ade3d69d8a2ed0aef89f4c8f752f79d74b7462f5bb3437680b72  libzenoh-pico-0.11.0.3.tar.gz
+sha256  db1eca9d84ca581731cf1f3f88aca785d58fb2b1972f2f07d09a0cf022ee02f9  libzenoh-pico-0.11.0.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 9163ba30ad..9f91926f0e 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,10 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 0.11.0.3
+# This 0.11.0 version is really newer than 0.11.0.3, so please don't
+# update 0.11.0.3 even if release-monitoring.org claims it's a newer
+# version.
+LIBZENOH_PICO_VERSION = 0.11.0
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
