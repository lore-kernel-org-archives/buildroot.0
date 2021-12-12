Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA72C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D62A404FD;
	Sun, 12 Dec 2021 14:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEHSv9mX2coH; Sun, 12 Dec 2021 14:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4C1E401B9;
	Sun, 12 Dec 2021 14:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11E651BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFDC940131
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERyoT16Fe5ll for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F17401B9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 333F083467; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a05e2c384c76a02686bc522c6ca31d434d58f45
X-Git-Newrev: f8901538cd0e507f8a5b462e3c3421415f3ceea7
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.333F083467@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.40.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8901538cd0e507f8a5b462e3c3421415f3ceea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/PurpleI2P/i2pd/releases/tag/2.40.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 4eceddba0a..99c474a2e5 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.39.0/SHA512SUMS
-sha512  6b38e6e2e763e94ffe9d11eb2f9a0e9554560bb4fec95891240adf5bc0a9639f879dac4ff3712a9f8e00895b7bbeabc854887e61fe9f9755c33f96899e20aa76  i2pd-2.39.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.40.0/SHA512SUMS
+sha512  58d10417f3fd2c2fb427fb88b30ccd3e03053c84aa7ac6d3e346c388f2376d1768846bec5ee8d5134dd62d5712b20f890af11083634f94095b1117f6494c25fd  i2pd-2.40.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 348311277d..8eea09493f 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.39.0
+I2PD_VERSION = 2.40.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
