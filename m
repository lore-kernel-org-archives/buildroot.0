Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011ABC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 17:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7009C404C8;
	Thu,  3 Nov 2022 17:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7009C404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sx4wYSwX-qyx; Thu,  3 Nov 2022 17:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99DE74047C;
	Thu,  3 Nov 2022 17:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DE74047C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25E1D1BF4DB
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAFCC417D5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAFCC417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEBJVSuHdSgs for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 17:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61616417A6
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61616417A6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 17:41:48 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout06.t-online.de (Postfix) with SMTP id 06EB24CFD
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:41:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oqeDV-0xiuaP0; Thu, 3 Nov 2022 18:41:26 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57158)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oqeDV-0001D3-22
 for buildroot@buildroot.org; Thu, 03 Nov 2022 18:41:25 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 18:41:25 +0100
Message-Id: <20221103174125.308556-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667497286-C2B221D1-B87137C1/0/0 CLEAN NORMAL
X-TOI-MSGID: 381551a6-9fb6-4e9d-8cf1-6bf82f0a48eb
Subject: [Buildroot] [PATCH 1/1] package/pixman: security bump version to
 0.42.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-October/003228.html
https://lists.x.org/archives/xorg-announce/2022-November/003249.html

Fixes CVE-2022-44638:
https://lists.x.org/archives/xorg-announce/2022-November/003251.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pixman/pixman.hash | 6 +++---
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 1af632a9f4..78407bf048 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-April/003043.html
-sha256  da8ed9fe2d1c5ef8ce5d1207992db959226bd4e37e3f88acf908fd9a71e2704e  pixman-0.40.0.tar.xz
-sha512  8a60edb113d68791b41bd90b761ff7b3934260cb3dada3234c9351416f61394e4157353bc4d61b8f6c2c619de470f6feefffb4935bfcf79d291ece6285de7270  pixman-0.40.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-October/003228.html
+sha256  5747d2ec498ad0f1594878cc897ef5eb6c29e91c53b899f7f71b506785fc1376  pixman-0.42.2.tar.xz
+sha512  3476e2676e66756b1af61b1e532cd80c985c191fb7956eb01702b419726cce99e79163b7f287f74f66414680e7396d13c3fee525cd663f12b6ac4877070ff4e8  pixman-0.42.2.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 3f65f0484d..6e6d787d27 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.40.0
+PIXMAN_VERSION = 0.42.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
