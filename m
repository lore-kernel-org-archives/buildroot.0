Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A67C0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4FB840BA;
	Sat, 14 Sep 2024 09:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDmD8wQEzRSp; Sat, 14 Sep 2024 09:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95028477F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95028477F;
	Sat, 14 Sep 2024 09:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1242A1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7D040179
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrbFszA2pP9B for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0399E4043A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0399E4043A
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B9B8706D; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31a9776150c9c54d02844b58fcb2ba298daf5125
X-Git-Newrev: 581031089f01c25beda6a8abb0cc51a64505f960
X-Patchwork-Hint: ignore
Message-Id: <20240914092253.73B9B8706D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.123
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

commit: https://git.buildroot.net/buildroot/commit/?id=581031089f01c25beda6a8abb0cc51a64505f960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-August/003528.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 9d78d5e437..aec9f58749 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-June/003518.html
-sha256  d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251  libdrm-2.4.122.tar.xz
-sha512  ea6bac94416d4ba0e9805e142ae62904236bc49f803d4fc10c92968a4df64c818dd42524ad7a4e988062836783a148e27094050bb2754f751a368627f794ad13  libdrm-2.4.122.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003528.html
+sha256  a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e  libdrm-2.4.123.tar.xz
+sha512  d3e6ba26bbd609fd87ca131690547eeb6a903c0a8c28b7f5cd5d0947619da09f31daf7bf4b6c38bf5e5dc173e2ccba476338ef682d8cf06d6b71ba73fc9b948d  libdrm-2.4.123.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index ea956de15b..fcf7f17e78 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.122
+LIBDRM_VERSION = 2.4.123
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
