Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FDCCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C59260861;
	Tue, 22 Oct 2024 21:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rlUHlb68Ret; Tue, 22 Oct 2024 21:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E1060855
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E1060855;
	Tue, 22 Oct 2024 21:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD0859F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF3481028
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQ47nD3P9elA for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C908A81025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C908A81025
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B784D86314; Tue, 22 Oct 2024 21:16:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 23:16:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a74b3b7c490d051a5ab8efddecfe0716fb17fc3
X-Git-Newrev: 2a7bac6fc4ea248b6a52b9c99c7622313c95e38d
X-Patchwork-Hint: ignore
Message-Id: <20241022211656.B784D86314@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettle: bump to version 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a7bac6fc4ea248b6a52b9c99c7622313c95e38d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 6c2486e260..5b11cd0daf 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.9.1.tar.gz.sig
-sha256  ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3  nettle-3.9.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz.sig
+sha256  b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c  nettle-3.10.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 20f755cc98..22a41ba55b 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.9.1
+NETTLE_VERSION = 3.10
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
