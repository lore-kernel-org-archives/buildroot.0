Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA8EE49A0
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 11:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DC9408E4;
	Wed, 23 Aug 2023 11:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9DC9408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8llUuPxegbTg; Wed, 23 Aug 2023 11:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6DC0408D9;
	Wed, 23 Aug 2023 11:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6DC0408D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FDFA1BF2EB
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBED7405E2
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBED7405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGyew2ZTRAy4 for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 11:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E7040BC5
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 11:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E7040BC5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3A9861EC; Wed, 23 Aug 2023 11:27:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 13:26:05 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0cf3f7aed93ec0f49ab153a4b99e25b604f65c68
X-Git-Newrev: 32d30be53634c778b8750fa25531f2f55e21587a
X-Patchwork-Hint: ignore
Message-Id: <20230823112716.EE3A9861EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: remove Bernd
 Kuhls from various packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=32d30be53634c778b8750fa25531f2f55e21587a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b6ea18e47c88b899ac45d8e60d3a7bc2f983d66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a540317ae9..6da1be8b48 100644
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
@@ -401,7 +396,6 @@ F:	package/libsidplay2/
 F:	package/libsilk/
 F:	package/libsndfile/
 F:	package/libsoundtouch/
-F:	package/libsquish/
 F:	package/libudfread/
 F:	package/libunibreak/
 F:	package/liburiparser/
@@ -450,7 +444,6 @@ F:	package/perl-www-robotrules/
 F:	package/php/
 F:	package/pixman/
 F:	package/pngquant/
-F:	package/pound/
 F:	package/pppd/
 F:	package/privoxy/
 F:	package/pure-ftpd/
@@ -471,7 +464,6 @@ F:	package/rrdtool/
 F:	package/rtmpdump/
 F:	package/samba4/
 F:	package/sofia-sip/
-F:	package/softether/
 F:	package/spandsp/
 F:	package/sqlite/
 F:	package/stellarium/
@@ -481,12 +473,8 @@ F:	package/tor/
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
