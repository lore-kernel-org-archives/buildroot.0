Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6662C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CCF409EF;
	Wed, 16 Feb 2022 18:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uc8HhmDf3BzU; Wed, 16 Feb 2022 18:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA0F409E4;
	Wed, 16 Feb 2022 18:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC1B91BF3DC
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB00A83DF9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEttZRRZO_jV for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 18:01:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 424BE83DF6
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 18:01:32 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout10.t-online.de (Postfix) with SMTP id 4383812AF3
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:01:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nKOcK-1kAGkj0; Wed, 16 Feb 2022 19:01:29 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36480)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nKOcK-0003n1-Ir
 for buildroot@buildroot.org; Wed, 16 Feb 2022 19:01:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 19:01:28 +0100
Message-Id: <20220216180128.49268-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645034489-0000BD0E-61712A7D/0/0 CLEAN NORMAL
X-TOI-MSGID: e791674b-9f0a-41ed-9cb5-daa2f46bdcbd
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.110
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
https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
