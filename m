Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B52C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D7360F70
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97D7360F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7175E80D24;
	Sun, 14 Nov 2021 14:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYLyUPdOXRhz; Sun, 14 Nov 2021 14:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B035480E39;
	Sun, 14 Nov 2021 14:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 052CF1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60EFC606D4
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKr3Jr3YcIwv for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A93606F7
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4F3388D1DB; Sun, 14 Nov 2021 14:05:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:02:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9bd02911565819789120370178e82da5dfbacc0
X-Git-Newrev: 4b0cc4537514159e72154a88657d3de46b5c7ab7
X-Patchwork-Hint: ignore
Message-Id: <20211114140518.4F3388D1DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bitwise: bump version
 to 0.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b0cc4537514159e72154a88657d3de46b5c7ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitwise/bitwise.hash | 2 +-
 package/bitwise/bitwise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
index 5493c642a6..c8daa0aa64 100644
--- a/package/bitwise/bitwise.hash
+++ b/package/bitwise/bitwise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2  bitwise-v0.42.tar.gz
+sha256  f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb  bitwise-v0.43.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
index 237f7753cd..33d8f6776b 100644
--- a/package/bitwise/bitwise.mk
+++ b/package/bitwise/bitwise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITWISE_VERSION = 0.42
+BITWISE_VERSION = 0.43
 BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
 BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
 BITWISE_DEPENDENCIES = ncurses readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
