Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3390C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BDC0820F2;
	Thu,  8 Dec 2022 22:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BDC0820F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fDXmgkQAyd2; Thu,  8 Dec 2022 22:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A15381F59;
	Thu,  8 Dec 2022 22:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A15381F59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A62A1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A406418BD
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A406418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reU398OmmMXh for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 798FC41914
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 798FC41914
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:37 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 0BB855A5B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX2-3PxxNk0; Thu, 8 Dec 2022 23:38:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX2-00048i-03
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:47 +0100
Message-Id: <20221208223817.1088619-41-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539100-3C882535-BE58F1E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 9038312d-ce4c-42fd-bb94-c68aae92ff37
Subject: [Buildroot] [PATCH 40/70] package/x11r7/xlib_libXext: bump version
 to 1.3.5
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

https://lists.x.org/archives/xorg-announce/2022-October/003241.html

Updated license hash due to upstream commits
https://gitlab.freedesktop.org/xorg/lib/libxext/-/commit/81a3d082b1c73393a59131aa57fe32bb0d76e149
https://gitlab.freedesktop.org/xorg/lib/libxext/-/commit/b6929c143e8372eb6838a331942d34a8d2b13b7b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 10 ++++------
 package/x11r7/xlib_libXext/xlib_libXext.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index e6b41a3dba..2ab509598b 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002975.html
-md5  f5b48bb76ba327cd2a8dc7a383532a95  libXext-1.3.4.tar.bz2
-sha1  14e2451162e8766173b5b14c73e94a22b1fcab55  libXext-1.3.4.tar.bz2
-sha256  59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b  libXext-1.3.4.tar.bz2
-sha512  09146397d95f80c04701be1cc0a9c580ab5a085842ac31d17dfb6d4c2e42b4253b89cba695e54444e520be359883a76ffd02f42484c9e2ba2c33a5a40c29df4a  libXext-1.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003241.html
+sha256  db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca  libXext-1.3.5.tar.xz
+sha512  fd9805982dabfb14b1526c0cb71f94508003fa3fcd60560d387465afd891c1dca61927ae86278436d53f4b840cacd1f412071fdc3dce1d6f730610a9c163d59b  libXext-1.3.5.tar.xz
 # Locally computed
-sha256  80767ac915f2f0f94de9efb15f0197a59b6f1e609cae85059f8703272dc3e146  COPYING
+sha256  fd62910be4b13829d94e76c1447cf840953f0e225c4dc6c79349c84dd0557f22  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 6002e59e0d..0bb3efa31f 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.4
-XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
-XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXEXT_VERSION = 1.3.5
+XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.xz
+XLIB_LIBXEXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
 XLIB_LIBXEXT_LICENSE_FILES = COPYING
 XLIB_LIBXEXT_CPE_ID_VENDOR = x
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
