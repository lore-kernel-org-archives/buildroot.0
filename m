Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4084DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F866103D
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2F866103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B720360B0D;
	Mon, 18 Oct 2021 19:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBBgApZtT-Mb; Mon, 18 Oct 2021 19:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03DD960AEC;
	Mon, 18 Oct 2021 19:22:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23F1F1BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC654021F
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JioCmVlGJ2vV for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:19:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432D3400EF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 14A398742D; Mon, 18 Oct 2021 19:15:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:16:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d7a36e08c0983e92b9e7ba42f49bf8dc945c16a
X-Git-Newrev: 08925bdcbae9214542ec8da119874e00f837ee0b
X-Patchwork-Hint: ignore
Message-Id: <20211018191554.14A398742D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcm2835: bump version to 1.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=08925bdcbae9214542ec8da119874e00f837ee0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog (since 1.68):

  - 1.69, 2021-03-30 Added link to Ada bindings by Tama McGlinn.
    Fixed problem with undefined off_t on some compilers.
  - 1.70, Patch to ensure compilation with gcc -std=c99, as reported by
    John Blaiklock. Fix some inconsistencies in version numbers.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index e366f19038..c9f7acfd01 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b7eda59fd7bc3cb97fdac14e8455e86ddad75006d69270358ac8d00108e369a9  bcm2835-1.68.tar.gz
+sha256  c062a8a1cf1dc1ba1ca3978451d2f668b66f7ce5548200a0f4a8bb2117b1b2c9  bcm2835-1.70.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 1ddd035818..e9d7256f19 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.68
+BCM2835_VERSION = 1.70
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
