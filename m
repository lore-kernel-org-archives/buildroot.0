Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0CDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:35:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9553600D0
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9553600D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D26D401E3;
	Sat,  4 Sep 2021 18:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBB5ogtCGesy; Sat,  4 Sep 2021 18:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBAD34013E;
	Sat,  4 Sep 2021 18:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F13EA1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D89D7401FD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gd5nulb2aMKs for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 050D040171
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC0248834C; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:12:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37f75b756182dd17871d1cd9e8bca83f326de690
X-Git-Newrev: 4e6084833816701fa940afb22f2b1ed64a163c93
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.CC0248834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.18.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e6084833816701fa940afb22f2b1ed64a163c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 7958cbac88..8b6a5466ed 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
-sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinput-1.18.0.tar.xz
-sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html
+sha256  9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb  libinput-1.18.1.tar.xz
+sha512  450e38c0f8245aa0165a8047d25aebee646332f0f2ed442bb2d1bd3e723c2082b6d00d6e3bda308981ece8e29b5cddbd56eab900d2b7497705a45fc27b281828  libinput-1.18.1.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 32b822edb7..844a4ae8ba 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.18.0
+LIBINPUT_VERSION = 1.18.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
