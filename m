Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2792EC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A73DF41765;
	Sun,  7 May 2023 16:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A73DF41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crmaFW0WDzsY; Sun,  7 May 2023 16:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C7541505;
	Sun,  7 May 2023 16:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C7541505
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDF401BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C5B41505
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C5B41505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgJ3p1gETbjc for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:18:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB873410BD
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB873410BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5989385FD0; Sun,  7 May 2023 16:18:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 18:10:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7d0ed4a78f4aa3741f94c4bbb69efbe74c920a9
X-Git-Newrev: 827bc83cb1aa891fbb41ea332a013d850a121760
X-Patchwork-Hint: ignore
Message-Id: <20230507161831.5989385FD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutp: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=827bc83cb1aa891fbb41ea332a013d850a121760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for bumping transmission to version 4.0.1.

Added configure option to fix build error with gcc-12.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libutp/libutp.hash | 2 +-
 package/libutp/libutp.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
index f347dc3f2c..0312f42612 100644
--- a/package/libutp/libutp.hash
+++ b/package/libutp/libutp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  484f802d044f774fa5f669476ecdd9cb6110c383781c39adc03bbf6575090771  libutp-059c9449a104e440e4f913756a5f560dd4ae76a9.tar.gz
+sha256  d856fde68828d52eb39df40e15ad5dc4efaa9a51d4121bcbfbe47fed2163d20a  libutp-c95738b1a6644b919e5b64d3ea9736cfc5894e0b.tar.gz
 sha256  73b400bf61dde52223dae1642205ca187f1a6b24a508dcce52bf386c27a0e58c  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
index 394c1e9cb9..df0617555d 100644
--- a/package/libutp/libutp.mk
+++ b/package/libutp/libutp.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBUTP_VERSION = 059c9449a104e440e4f913756a5f560dd4ae76a9
+LIBUTP_VERSION = c95738b1a6644b919e5b64d3ea9736cfc5894e0b
 LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
 LIBUTP_LICENSE = MIT
 LIBUTP_LICENSE_FILES = LICENSE
 LIBUTP_INSTALL_STAGING = YES
+LIBUTP_CONF_OPTS = -DLIBUTP_ENABLE_WERROR=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
