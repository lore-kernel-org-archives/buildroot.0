Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCA4C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:03:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D0261104
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24D0261104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E803C60729;
	Fri,  6 Aug 2021 21:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQNw5SJL-e1y; Fri,  6 Aug 2021 21:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2807960AA2;
	Fri,  6 Aug 2021 21:03:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 507B91C116E
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A3C4401CF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j44BeGmy-t4Y for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4495E401B9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 81B3A8C994; Fri,  6 Aug 2021 21:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 21:48:26 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4cc8b8c47ebd09fb1e485d2e4d47003f66f5f46a
X-Git-Newrev: 9802df87ba66d6e86561a0a5a3b4d8c5f587279c
X-Patchwork-Hint: ignore
Message-Id: <20210806210246.81B3A8C994@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xserver_xorg-server: bump version to 1.20.12
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9802df87ba66d6e86561a0a5a3b4d8c5f587279c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2021-July/003098.html

Follow upstream switch to .xz tarballs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5141b64eb36e1f9a7683c702f020d11990bf041a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 9876255c8e..167d3fa591 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003081.html
-sha256  914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49  xorg-server-1.20.11.tar.bz2
-sha512  1017015b9fd5d53788abe3641d877e6df8609841fa5c1847c0a5e133ddcc1b758a5d695304ebd36828099ec201a85b6b70b46f5ea4f81c5bd3a16fa6e175e3c2  xorg-server-1.20.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-July/003098.html
+sha256  336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac  xorg-server-1.20.12.tar.xz
+sha512  98350c42fb1f10c965663c1c8d4b225689a6a63163d788d454aa71b28b9cc8fcf9709a932f882358a13ca0c277c0c15812d05919092b4c32828d4ed61cca0406  xorg-server-1.20.12.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ae17dd535e..26cc1c07b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.11
-XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
+XSERVER_XORG_SERVER_VERSION = 1.20.12
+XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
