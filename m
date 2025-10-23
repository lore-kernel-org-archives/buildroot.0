Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB7CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 19:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9297849FE;
	Thu, 23 Oct 2025 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGKkP4hxQmzu; Thu, 23 Oct 2025 19:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C068E849F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C068E849F8;
	Thu, 23 Oct 2025 19:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E43F43F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50931849F8
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJtIdg5YeiA9 for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872FE849F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 872FE849F6
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8065C877A9; Thu, 23 Oct 2025 19:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 21:38:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3a3316bf0af5516319484916cf5bc2032d37758
X-Git-Newrev: dea4f02bbb24b2125df6f4aa7a4b301a2316ef06
X-Patchwork-Hint: ignore
Message-Id: <20251023195659.8065C877A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump version to 2.58.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dea4f02bbb24b2125df6f4aa7a4b301a2316ef06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/PurpleI2P/i2pd/blob/2.58.0/ChangeLog

Needed for bump of libminiupnpc to version 2.3.3:
https://github.com/PurpleI2P/i2pd/blob/openssl/ChangeLog#L176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index cc099a94ff..a539a4dd1a 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.50.2/SHA512SUMS
-sha512  7df7a578711a959feee4326060829cf87c0d1669e473934549cb59d868a7aef7300ecd2d7a6b92a2295aa7e97964cc16d0e44a334db917e22b0b59573a9052de  i2pd-2.50.2.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.58.0/SHA512SUMS
+sha512  d5d87a04ff5f8481516c00b07dd46726dfb3f0de67f4932874a0655b4adfa448a434056a131d727dd79a2f3ee1f6cc9aef5dc176a0b5ab546d8e94b6c0b38ee5  i2pd-2.58.0.tar.gz
 # Locally computed:
-sha256  e32cc0171ce3301afa67d83f61598f29af7efdf8218dfb66cc1a72224474ec2c  LICENSE
+sha256  5ec428c65b0bc8680e08daa75aa060fe72b5b3c3b89082ac02031e0f2d3d0039  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 402931c655..3681e6006e 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.50.2
+I2PD_VERSION = 2.58.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
