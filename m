Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39CBC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 08:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC49560791;
	Sat, 31 May 2025 08:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZdqx0oJp-eE; Sat, 31 May 2025 08:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B986077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B986077F;
	Sat, 31 May 2025 08:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C60117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E890240025
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ja0CJfLKIUb5 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 08:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C3440111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C3440111
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3414F876DF; Sat, 31 May 2025 08:34:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 10:34:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9a9930de0c873e68de1c8242ff9281d87eda722
X-Git-Newrev: 52e1049491294e314bacd44ef960360c0f3b521a
X-Patchwork-Hint: ignore
Message-Id: <20250531083446.3414F876DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sipeed-lpi4abin:
 upgrade to newer version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=52e1049491294e314bacd44ef960360c0f3b521a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

One single commit upstream:

    sbi: add debian prebuilt v1.6 & remove vendor 0.9 sbi & update mainline opensbi

      * mainline opensbi commit: 140844b3bd4a6f2919ccd2ff5e93c6222a4f71fb
      * mainline opensbi-h commit: 83f3e406cf48a0228c0e0738758d48ccfcbb6ae9

Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sipeed-lpi4abin/sipeed-lpi4abin.hash | 2 +-
 package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
index 9d66be164b..7281f38cd2 100644
--- a/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a1c608a7b0cc641d39666a07d8bb1a73ded35385316989c3e8182d968ed89b3e  sipeed-lpi4abin-44ec4e1cc82141963842ec45db0d1617f9f07e75-git4.tar.gz
+sha256  c0c2daed3c56ba30a26d81986dfa041101c58db994372d601f126cab8fa01013  sipeed-lpi4abin-725756411ecc20f2c2dbc5ea6b8e5aacc6f83aad-git4.tar.gz
diff --git a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
index f2338576d8..59ef9ff918 100644
--- a/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
+++ b/package/sipeed-lpi4abin/sipeed-lpi4abin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIPEED_LPI4ABIN_VERSION = 44ec4e1cc82141963842ec45db0d1617f9f07e75
+SIPEED_LPI4ABIN_VERSION = 725756411ecc20f2c2dbc5ea6b8e5aacc6f83aad
 SIPEED_LPI4ABIN_SITE = https://github.com/revyos/th1520-boot-firmware.git
 SIPEED_LPI4ABIN_SITE_METHOD = git
 SIPEED_LPI4ABIN_LICENSE = PROPRIETARY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
