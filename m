Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F85C432BE
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AF3613DB
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1AF3613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98984606BF;
	Tue, 24 Aug 2021 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JP2qFlglFkwt; Tue, 24 Aug 2021 21:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22AB66138E;
	Tue, 24 Aug 2021 21:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE0E1BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B6EE81BF4
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXOs0kxn09C5 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:56:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B524380F4E
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B4C2E8DBE5; Tue, 24 Aug 2021 21:55:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:55:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6976d7df495943ad8d46372a7b46b936754b996b
X-Git-Newrev: b9ed05a03fbbdca6d5c0e638479b5cdd49e65ff5
X-Patchwork-Hint: ignore
Message-Id: <20210824215555.B4C2E8DBE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: bump to version
 0.22.10
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6569748930354148539=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6569748930354148539==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b9ed05a03fbbdca6d5c0e638479b5cdd49e65ff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 1079ccf367..3847fc6724 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  9617ed08c9ffafcf5f925819251f6b90df3f4f73cf2838c41033e1962104286d  mpd-0.22.8.tar.xz
+sha256  07c82535e9999c3d4a099d8e652c88724635125b3c9f265ba9b6f2974ff9e614  mpd-0.22.10.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e5e5097048..62e31860c0 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.22
-MPD_VERSION = $(MPD_VERSION_MAJOR).8
+MPD_VERSION = $(MPD_VERSION_MAJOR).10
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost

--===============6569748930354148539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6569748930354148539==--
