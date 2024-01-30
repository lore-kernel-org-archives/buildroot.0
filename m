Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9616AC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C67D83518;
	Tue, 30 Jan 2024 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C67D83518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LipFg-PjtGLA; Tue, 30 Jan 2024 22:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 992F48392C;
	Tue, 30 Jan 2024 22:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992F48392C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E88DB1BF868
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2AC0832DC
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AC0832DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlQSPLYw9Akr for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:14:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA26D81839
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA26D81839
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A4B8674A; Tue, 30 Jan 2024 22:14:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 23:12:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41839480c436fee6035cfe54c8f065e8c4061f97
X-Git-Newrev: 6f96d2d3157a9ff7491defc24be682468d7a04bf
X-Patchwork-Hint: ignore
Message-Id: <20240130221444.D4A4B8674A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to version 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f96d2d3157a9ff7491defc24be682468d7a04bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index c25a737809..71c2f7cb6d 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  f38b42fa849d4d1d5a4dd4ca3013b4b297861cba53970e665e295d3e57de58e6  libcamera-v0.1.0-br1.tar.gz
+sha256  7f26568147f4f2acc795da7f26de63a5a15d544d87fb1531a1a1ef2c34c75030  libcamera-v0.2.0-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index c9af90f35f..eecbaa44b9 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.1.0
+LIBCAMERA_VERSION = v0.2.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
