Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C427AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7992B40BD8;
	Sun, 29 May 2022 08:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSGJ5Nx61U0y; Sun, 29 May 2022 08:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E36F40537;
	Sun, 29 May 2022 08:37:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB3BE1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7F861100
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlF4DfDMySCk for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC5D461101
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6AE2C8643D; Sun, 29 May 2022 08:24:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:26:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e57fd610eaf7b9552c61cb74dfaf687c57b59c2f
X-Git-Newrev: 50354ae9d182142d26086e70a58faaba0a7f3ec0
X-Patchwork-Hint: ignore
Message-Id: <20220529082411.6AE2C8643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/alsa-lib: bump
 version to 1.2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=50354ae9d182142d26086e70a58faaba0a7f3ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://www.alsa-project.org/wiki/Changes_v1.2.6_v1.2.6.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 278138a0b55cf448bd39bac2dc5c7e0773b064fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 97bcd87141..42040d631b 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7fe3057894ec319118abfd042ef84632a1dcd911806ec9fff6daaa68d15a8c52  alsa-lib-1.2.6.tar.bz2
+sha256  ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f  alsa-lib-1.2.6.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 5d12f5e6d8..1aa1b4c276 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.6
+ALSA_LIB_VERSION = 1.2.6.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
