Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D9C83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F88C4181F;
	Wed, 30 Aug 2023 22:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F88C4181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI9ouJkMJSjt; Wed, 30 Aug 2023 22:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9C0841895;
	Wed, 30 Aug 2023 22:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C0841895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB36D1BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2AFA60DA5
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2AFA60DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdupZ2xqCkt4 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D3AC612CD
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3AC612CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09FD8866C1; Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:18:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: edab7e0f75f566d7c0ae4274183c25f0b94e6149
X-Git-Newrev: a220cfad564160ea718c4c4bb33a7dcf090d47c3
X-Patchwork-Hint: ignore
Message-Id: <20230830223119.09FD8866C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: sort entries
 of Bernd Kuhls
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

commit: https://git.buildroot.net/buildroot/commit/?id=a220cfad564160ea718c4c4bb33a7dcf090d47c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 210306b4fa1f1a018393c69334eb48bf247a91c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed31497f89..31f108fed0 100644
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
@@ -372,8 +372,8 @@ F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
 F:	package/libebur128/
-F:	package/libfribidi/
 F:	package/libfreeglut/
+F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
 F:	package/libglfw/
@@ -435,9 +435,9 @@ F:	package/perl-io-html/
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
@@ -449,17 +449,17 @@ F:	package/pure-ftpd/
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
