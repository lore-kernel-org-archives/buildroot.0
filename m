Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F09EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C90808210C;
	Mon, 10 Jul 2023 17:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90808210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-VYCPFxkCQx; Mon, 10 Jul 2023 17:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10210820D4;
	Mon, 10 Jul 2023 17:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10210820D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08B0B1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3AFD40B5D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3AFD40B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrqYvP7_hvwH for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E52240A84
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E52240A84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EE4886C8E; Mon, 10 Jul 2023 17:46:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:46:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d271346e560dd08faf7c4e51c4b46517d5f2638
X-Git-Newrev: 2b6ea18e47c88b899ac45d8e60d3a7bc2f983d66
X-Patchwork-Hint: ignore
Message-Id: <20230710174648.1EE4886C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bernd Kuhls from
 various packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b6ea18e47c88b899ac45d8e60d3a7bc2f983d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a5aad2be3..086e0478eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -321,8 +321,6 @@ F:	package/apr-util/
 F:	package/bcg729/
 F:	package/bento4/
 F:	package/bitcoin/
-F:	package/bluez-tools/
-F:	package/boinc/
 F:	package/clamav/
 F:	package/dav1d/
 F:	package/dht/
@@ -343,13 +341,10 @@ F:	package/fstrcmp/
 F:	package/ghostscript/
 F:	package/giflib/
 F:	package/gkrellm/
-F:	package/gli/
-F:	package/glmark2/
 F:	package/gpsd/
 F:	package/gptfdisk/
 F:	package/hdparm/
 F:	package/hddtemp/
-F:	package/inih/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
@@ -400,7 +395,6 @@ F:	package/libsidplay2/
 F:	package/libsilk/
 F:	package/libsndfile/
 F:	package/libsoundtouch/
-F:	package/libsquish/
 F:	package/libudfread/
 F:	package/libunibreak/
 F:	package/liburiparser/
@@ -449,7 +443,6 @@ F:	package/perl-www-robotrules/
 F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
-F:	package/pound/
 F:	package/pppd/
 F:	package/privoxy/
 F:	package/pure-ftpd/
@@ -470,7 +463,6 @@ F:	package/rrdtool/
 F:	package/rtmpdump/
 F:	package/samba4/
 F:	package/sofia-sip/
-F:	package/softether/
 F:	package/spandsp/
 F:	package/sqlite/
 F:	package/stellarium/
@@ -480,12 +472,8 @@ F:	package/tor/
 F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
-F:	package/utf8proc/
-F:	package/vdr/
-F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
-F:	package/waylandpp/
 F:	package/wget/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
