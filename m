Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91774C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 11:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29FE46112F;
	Sun, 11 Jun 2023 11:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FE46112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Us_-LYHACeoZ; Sun, 11 Jun 2023 11:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E3560F56;
	Sun, 11 Jun 2023 11:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E3560F56
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286521BF5DC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FDF400D3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FDF400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i84Ccn7RGDdX for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 11:22:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42FEB4011A
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FEB4011A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:22:51 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout07.t-online.de (Postfix) with SMTP id 6ACBF54F7C
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:22:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8J9k-1BNaAj0; Sun, 11 Jun 2023 13:22:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50026)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8J9k-0006sI-08
 for buildroot@buildroot.org; Sun, 11 Jun 2023 13:22:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 13:22:46 +0200
Message-Id: <20230611112247.717566-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686482568-5A7F357F-1D9EDC35/0/0 CLEAN NORMAL
X-TOI-MSGID: 426e11a7-972a-46b7-b1e1-fc53d1302f1b
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add Bernd Kuhls to various
 packages
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 084a533506..6945f0df86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -329,11 +329,13 @@ F:	package/dht/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
+F:	package/ethtool/
 F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
 F:	package/ffmpeg/
 F:	package/flac/
+F:	package/flatbuffers/
 F:	package/freeswitch/
 F:	package/freeswitch-mod-bcg729/
 F:	package/freetype/
@@ -355,12 +357,14 @@ F:	package/intel-microcode/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
+F:	package/lcms2/
 F:	package/leafnode2/
 F:	package/libaacs/
 F:	package/libass/
 F:	package/libbdplus/
 F:	package/libbluray/
 F:	package/libbroadvoice/
+F:	package/libcap/
 F:	package/libcdio/
 F:	package/libcec/
 F:	package/libcodec2/
@@ -372,6 +376,7 @@ F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
 F:	package/libebur128/
+F:	package/libfribidi/
 F:	package/libfreeglut/
 F:	package/libg7221/
 F:	package/libglew/
@@ -400,16 +405,23 @@ F:	package/libudfread/
 F:	package/libunibreak/
 F:	package/liburiparser/
 F:	package/libutp/
+F:	package/libuv/
 F:	package/libva/
 F:	package/libva-intel-driver/
 F:	package/libva-utils/
 F:	package/libvorbis/
 F:	package/libvpx/
 F:	package/libyuv/
+F:	package/linux-firmware/
+F:	package/mc/
 F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
+F:	package/mpg123/
+F:	package/ntp/
 F:	package/nut/
+F:	package/opus/
+F:	package/pciutils/
 F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
@@ -438,6 +450,8 @@ F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
 F:	package/pound/
+F:	package/pppd/
+F:	package/privoxy/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
@@ -452,8 +466,10 @@ F:	package/python-pylru/
 F:	package/python-requests-oauthlib/
 F:	package/python-slob/
 F:	package/rsync/
+F:	package/rrdtool/
 F:	package/rtmpdump/
 F:	package/samba4/
+F:	package/sofia-sip/
 F:	package/softether/
 F:	package/spandsp/
 F:	package/sqlite/
@@ -470,6 +486,9 @@ F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
 F:	package/waylandpp/
+F:	package/wget/
+F:	package/wireless-regdb/
+F:	package/wireless_tools/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
