Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CC8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B70B60692;
	Sun, 18 Dec 2022 13:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B70B60692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCle_iJV0LGs; Sun, 18 Dec 2022 13:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D57605D8;
	Sun, 18 Dec 2022 13:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D57605D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A083B1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89A9880D1B
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89A9880D1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inwmJhhowu3p for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3CD080BED
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CD080BED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F87C86807; Sun, 18 Dec 2022 13:49:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:44:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af6f7aa76db5aed1eada0b27bd0375610a2fc728
X-Git-Newrev: d005917d7256c79b2f50010d48f36846333a457a
X-Patchwork-Hint: ignore
Message-Id: <20221218134918.9F87C86807@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xutil_makedepend: bump
 version to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d005917d7256c79b2f50010d48f36846333a457a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-December/003300.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 6 +++---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 3a7496e1a4..e2fe117f10 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003243.html
-sha256  a729cfd3c0f4e16c0db1da351e7f53335222e058e3434e84f91251fd6d407065  makedepend-1.0.7.tar.xz
-sha512  fd575de737aa56ef8e475d1ddb7b2392e730ee1b23c0b853bbb21975b757c3fc56f94d57ecc5a784dceed2be653feb10909e86fd96fdc074b50fbbd0e27a19db  makedepend-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003300.html
+sha256  bfb26f8025189b2a01286ce6daacc2af8fe647440b40bb741dd5c397572cba5b  makedepend-1.0.8.tar.xz
+sha512  6707b1107c07d4ffbcf008181e877d18a0bcc4aea03860ee1158f5630c7fdce4cf9ad7bee3b38ee420c3a44819ed4b56a6f2428a5b695c0dbd17fb3e60825a6d  makedepend-1.0.8.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index b16bbe0978..0c4a32c006 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.7
+XUTIL_MAKEDEPEND_VERSION = 1.0.8
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
 XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
