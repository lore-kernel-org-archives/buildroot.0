Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2952CEE49B0
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 11:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F52408CA;
	Wed, 23 Aug 2023 11:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F52408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpvFf89RtG1o; Wed, 23 Aug 2023 11:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8051D408E0;
	Wed, 23 Aug 2023 11:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8051D408E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910A71BF2EB
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6924A408D6
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6924A408D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GbUOqMBJjGH for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 178FD408CA
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 178FD408CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A49861DD; Wed, 23 Aug 2023 11:25:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 13:25:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7814dbce1580c51f62255105ae572da2c42f2eb4
X-Git-Newrev: b38be2fcaed2ddf64564d0a9d77dd7077bf1ced3
X-Patchwork-Hint: ignore
Message-Id: <20230823112551.02A49861DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: add Bernd
 Kuhls to various packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=b38be2fcaed2ddf64564d0a9d77dd7077bf1ced3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d271346e560dd08faf7c4e51c4b46517d5f2638)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aaa7196455..2119c52d93 100644
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
@@ -355,6 +357,7 @@ F:	package/intel-microcode/
 F:	package/jsoncpp/
 F:	package/kodi*
 F:	package/lame/
+F:	package/lcms2/
 F:	package/leafnode2/
 F:	package/libaacs/
 F:	package/libasplib/
@@ -362,6 +365,7 @@ F:	package/libass/
 F:	package/libbdplus/
 F:	package/libbluray/
 F:	package/libbroadvoice/
+F:	package/libcap/
 F:	package/libcdio/
 F:	package/libcec/
 F:	package/libcodec2/
@@ -373,6 +377,7 @@ F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
 F:	package/libebur128/
+F:	package/libfribidi/
 F:	package/libfreeglut/
 F:	package/libg7221/
 F:	package/libglew/
@@ -401,16 +406,23 @@ F:	package/libudfread/
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
@@ -439,6 +451,8 @@ F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
 F:	package/pound/
+F:	package/pppd/
+F:	package/privoxy/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
@@ -453,8 +467,10 @@ F:	package/python-pylru/
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
@@ -471,6 +487,9 @@ F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
 F:	package/waylandpp/
+F:	package/wget/
+F:	package/wireless-regdb/
+F:	package/wireless_tools/
 F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
