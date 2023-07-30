Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039C2C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 12:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985A741685;
	Sun, 30 Jul 2023 12:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985A741685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQy3lnk64dhl; Sun, 30 Jul 2023 12:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E7D41680;
	Sun, 30 Jul 2023 12:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63E7D41680
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF8F1BF419
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 798BF60B9C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 12:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 798BF60B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2laE2QxMvVfe for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E97560B9F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E97560B9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D47083C6A; Sun, 30 Jul 2023 12:41:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 14:40:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50d081916e57c132ad726743ff3e664d2ced7235
X-Git-Newrev: 210306b4fa1f1a018393c69334eb48bf247a91c7
X-Patchwork-Hint: ignore
Message-Id: <20230730124111.2D47083C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: sort entries of Bernd Kuhls
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

commit: https://git.buildroot.net/buildroot/commit/?id=210306b4fa1f1a018393c69334eb48bf247a91c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42d08f7fc7..fe2ebc3e1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,8 +343,8 @@ F:	package/giflib/
 F:	package/gkrellm/
 F:	package/gpsd/
 F:	package/gptfdisk/
-F:	package/hdparm/
 F:	package/hddtemp/
+F:	package/hdparm/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
@@ -362,19 +362,19 @@ F:	package/libbroadvoice/
 F:	package/libcap/
 F:	package/libcdio/
 F:	package/libcec/
-F:	package/libdisplay-info/
 F:	package/libcodec2/
 F:	package/libcrossguid/
 F:	package/libde265/
 F:	package/libdeflate/
+F:	package/libdisplay-info/
 F:	package/libdrm/
 F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
 F:	package/libebur128/
-F:	package/libfribidi/
 F:	package/libfreeglut/
+F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
 F:	package/libglfw/
@@ -437,9 +437,9 @@ F:	package/perl-io-html/
 F:	package/perl-lwp-mediatypes/
 F:	package/perl-mail-dkim/
 F:	package/perl-mailtools/
+F:	package/perl-netaddr-ip/
 F:	package/perl-net-dns/
 F:	package/perl-net-http/
-F:	package/perl-netaddr-ip/
 F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
@@ -451,17 +451,17 @@ F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
 F:	package/python-glslang/
+F:	package/python-mako/
 F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
-F:	package/python-mako/
 F:	package/python-oauthlib/
 F:	package/python-pyicu/
 F:	package/python-pylru/
 F:	package/python-requests-oauthlib/
 F:	package/python-slob/
-F:	package/rsync/
 F:	package/rrdtool/
+F:	package/rsync/
 F:	package/rtmpdump/
 F:	package/samba4/
 F:	package/sofia-sip/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
