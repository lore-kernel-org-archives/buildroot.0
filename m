Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89A7C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50FD440469;
	Mon, 12 Dec 2022 19:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50FD440469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPuZeh9rTZ33; Mon, 12 Dec 2022 19:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91BFF408A3;
	Mon, 12 Dec 2022 19:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BFF408A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2BE51BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBABC60DCB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBABC60DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aiPkRZHa_4l for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 19:45:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F132360D78
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 19:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F132360D78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEB4586019; Mon, 12 Dec 2022 19:45:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 20:44:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3b31a39fdffbf738789885f6e318131055e4b9b
X-Git-Newrev: d3d1d5a2dab19a954915c807e90ac74708b7e9ce
X-Patchwork-Hint: ignore
Message-Id: <20221212194529.DEB4586019@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packaeg/libmbim: fix license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3d1d5a2dab19a954915c807e90ac74708b7e9ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit i57bea338e95e49bf1f2405908462686306044825 forgot to update
license files:
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/bb3091e2c8d44caccfb868505a730a4ac5a48b44

Fixes:
 - http://autobuild.buildroot.org/results/06cb9426d097657b669b7970994584592bac9868

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmbim/libmbim.hash | 4 ++--
 package/libmbim/libmbim.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 2e2b46fcdb..8e7633cb94 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index e728cf58f9..59f55a57bc 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -7,7 +7,8 @@
 LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
-LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
+LIBMBIM_LICENSE_FILES = \
+	LICENSES/GPL-2.0-or-later.txt LICENSES/LGPL-2.1-or-later.txt
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
