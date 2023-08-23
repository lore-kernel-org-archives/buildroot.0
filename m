Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A8EE4993
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 11:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A35408CA;
	Wed, 23 Aug 2023 11:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A35408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9OmYrP-cRXh; Wed, 23 Aug 2023 11:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4AC408D6;
	Wed, 23 Aug 2023 11:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4AC408D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9AE1BF2EB
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236AE81A3E
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236AE81A3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP90JtqRT99X for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC3F81A34
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC3F81A34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BF50861DE; Wed, 23 Aug 2023 11:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 13:25:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: b38be2fcaed2ddf64564d0a9d77dd7077bf1ced3
X-Git-Newrev: e66213ee55899d1989f693ea45d501f9a5e18476
X-Patchwork-Hint: ignore
Message-Id: <20230823112551.0BF50861DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: remove Bernd
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

commit: https://git.buildroot.net/buildroot/commit/?id=e66213ee55899d1989f693ea45d501f9a5e18476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b6ea18e47c88b899ac45d8e60d3a7bc2f983d66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2119c52d93..ad3b634b7e 100644
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
