Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09879C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:23:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3ADF610A3
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3ADF610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86E074071F;
	Wed, 25 Aug 2021 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55X0CzX9zcbr; Wed, 25 Aug 2021 20:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D8C42538;
	Wed, 25 Aug 2021 20:22:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64E0B1BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54293613EA
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwRcdNSsuIBf for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:22:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6473860670
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:22:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 48E8C89079; Wed, 25 Aug 2021 20:21:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 22:03:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f911a17257d945eb3cb5c9c9a966f0e5fca0842
X-Git-Newrev: a29124febfb0f59d6a97d2cdede95c853eaf87e3
X-Patchwork-Hint: ignore
Message-Id: <20210825202152.48E8C89079@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Maxime Hadjinlian
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a29124febfb0f59d6a97d2cdede95c853eaf87e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maxime has not been contributing to Buildroot for several years, so it
doesn't make sense to keep him in the DEVELOPERS file and make us
think that those packages are being maintained and to Cc: him on
patches affecting those packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d2fbf4cf3..53448dd100 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1876,36 +1876,6 @@ F:	package/postgis/
 F:	package/protozero/
 F:	package/timescaledb/
 
-N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-F:	package/babeld/
-F:	package/dante/
-F:	package/faifa/
-F:	package/initscripts/
-F:	package/intel-microcode/
-F:	package/iucode-tool/
-F:	package/jasper/
-F:	package/kodi/
-F:	package/libass/
-F:	package/libbluray/
-F:	package/libcdio/
-F:	package/libcofi/
-F:	package/libenca/
-F:	package/libmodplug/
-F:	package/libnfs/
-F:	package/libplist/
-F:	package/libshairplay/
-F:	package/linux-zigbee/
-F:	package/netcat-openbsd/
-F:	package/open-plc-utils/
-F:	package/rpi-firmware/
-F:	package/rpi-userland/
-F:	package/rtmpdump/
-F:	package/skeleton/
-F:	package/systemd/
-F:	package/systemd-bootchart/
-F:	package/tinyalsa/
-F:	package/tinyxml/
-
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
