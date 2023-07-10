Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE4EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6193E820D4;
	Mon, 10 Jul 2023 17:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6193E820D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eQSHjEwp6pd; Mon, 10 Jul 2023 17:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F73820FD;
	Mon, 10 Jul 2023 17:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F73820FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68D211BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418EF41794
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 418EF41794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShVFtwmb_JEK for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 268DB4177F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268DB4177F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1607E86C8B; Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:46:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 506f018b3a8709190f79f19c8d7824b3cfa18191
X-Git-Newrev: 7d271346e560dd08faf7c4e51c4b46517d5f2638
X-Patchwork-Hint: ignore
Message-Id: <20230710174648.1607E86C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Bernd Kuhls to various
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d271346e560dd08faf7c4e51c4b46517d5f2638
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e716642c6b..2a5aad2be3 100644
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
 F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
