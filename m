Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB3C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED96F40639;
	Sun, 24 Mar 2024 15:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bQxNLVa3ENW; Sun, 24 Mar 2024 15:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F76940673
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F76940673;
	Sun, 24 Mar 2024 15:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF081BF861
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F8640469
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpMSKDC4mWUs for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D85240004
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D85240004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6008C83B5F; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:58:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e545cd269e0a3bbd6f859f885c887f14d3bd2d9
X-Git-Newrev: e248a312b04a86881b5a243433a213bfd8eea057
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.6008C83B5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.50.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e248a312b04a86881b5a243433a213bfd8eea057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (date updated with
https://github.com/PurpleI2P/i2pd/commit/d5ee1f602fdc7a47ccc9a4e239ea720dd63f123a)

https://github.com/PurpleI2P/i2pd/blob/2.50.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 98c0db243d..cc099a94ff 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.43.0/SHA512SUMS
-sha512  7247850cd47cccc540346b4a1becc6dba5f40bcb333cd722e9fc59fd8b0beddee700376829d29add05cea6b84bb34303ed37e01914a1a41cf8cd94fe5c826e4a  i2pd-2.43.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.50.2/SHA512SUMS
+sha512  7df7a578711a959feee4326060829cf87c0d1669e473934549cb59d868a7aef7300ecd2d7a6b92a2295aa7e97964cc16d0e44a334db917e22b0b59573a9052de  i2pd-2.50.2.tar.gz
 # Locally computed:
-sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
+sha256  e32cc0171ce3301afa67d83f61598f29af7efdf8218dfb66cc1a72224474ec2c  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index ad268a235c..402931c655 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.43.0
+I2PD_VERSION = 2.50.2
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
