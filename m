Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5502C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:21:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815FC61052
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 815FC61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51CDE605E3;
	Sat,  7 Aug 2021 17:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6aA0IyRn6ge; Sat,  7 Aug 2021 17:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E5A605A4;
	Sat,  7 Aug 2021 17:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5BD1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6530C4017E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUm8xolIp8vj for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 453C14021B
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 892858CA2E; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:12:57 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5bdfdf3611c1f47280b38200a527473643ac115b
X-Git-Newrev: b319277b236dc230016c8d285762c1fba00487a7
X-Patchwork-Hint: ignore
Message-Id: <20210807171927.892858CA2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xserver_xorg-server: bump version to 1.20.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=b319277b236dc230016c8d285762c1fba00487a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2021-July/003100.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 135252b53762daafdae26481abbbef0f440599a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 167d3fa591..8eb56ba027 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-July/003098.html
-sha256  336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac  xorg-server-1.20.12.tar.xz
-sha512  98350c42fb1f10c965663c1c8d4b225689a6a63163d788d454aa71b28b9cc8fcf9709a932f882358a13ca0c277c0c15812d05919092b4c32828d4ed61cca0406  xorg-server-1.20.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2021-July/003100.html
+sha256  40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300  xorg-server-1.20.13.tar.xz
+sha512  4e0b7bd4e070dc52cb2c51c2056feb133de2c0487d359392ed63abba9702910cd2e2983e9415973d8d6e9672eac78be6f39202687fc56610877914ce722554b3  xorg-server-1.20.13.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 26cc1c07b5..c326230be0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.12
+XSERVER_XORG_SERVER_VERSION = 1.20.13
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
