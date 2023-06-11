Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F91C77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 11:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B720360F93;
	Sun, 11 Jun 2023 11:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B720360F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQHeO-5ANdXq; Sun, 11 Jun 2023 11:22:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF54560C07;
	Sun, 11 Jun 2023 11:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF54560C07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D23501BF5DC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B98864011B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B98864011B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkaR0HQtQGH8 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 11:22:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E293D400D3
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E293D400D3
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:22:50 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout03.t-online.de (Postfix) with SMTP id DABB9283F2
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:22:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8J9k-44jawD0; Sun, 11 Jun 2023 13:22:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50026)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8J9k-0006sI-0M
 for buildroot@buildroot.org; Sun, 11 Jun 2023 13:22:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 13:22:47 +0200
Message-Id: <20230611112247.717566-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611112247.717566-1-bernd.kuhls@t-online.de>
References: <20230611112247.717566-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686482568-33FFCCD8-A793400F/0/0 CLEAN NORMAL
X-TOI-MSGID: c68d9574-d85c-49d3-8069-34c13f666010
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: remove Bernd Kuhls from various
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

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6945f0df86..0ba62834af 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
