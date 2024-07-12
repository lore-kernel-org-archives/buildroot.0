Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E69C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD335413AE;
	Fri, 12 Jul 2024 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpuyVvmsgiJO; Fri, 12 Jul 2024 20:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384E0402BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384E0402BF;
	Fri, 12 Jul 2024 20:54:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AFB61BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D57402BF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzCL8ZoAUtTX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51AEF40001
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51AEF40001
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44025861EF; Fri, 12 Jul 2024 20:54:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:54:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9b5d9170f943ae61fc10a9d119a4ac26e645418
X-Git-Newrev: b919d852e2a09b3517b79f8d0a5edeca21d2a9bb
X-Patchwork-Hint: ignore
Message-Id: <20240712205441.44025861EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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

commit: https://git.buildroot.net/buildroot/commit/?id=b919d852e2a09b3517b79f8d0a5edeca21d2a9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prelink-cross/prelink-cross.hash | 2 +-
 package/prelink-cross/prelink-cross.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 4aa3a86c45..286fef9fc3 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce0d58b7c60a441fd61c52329e2c767f7888056c491f55627a5304b13fda743f  prelink-cross-440c0059a21f06b5577499a80b55482cb99d6d1c-git4.tar.gz
+sha256  a8fdf6e96032d2300102c549bdb4d961fef4e546874d79cda1f88fa07912e30c  prelink-cross-ff2561c02ade96c5d4d56ddd4e27ff064840a176-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
index c32ea74afd..e554a423d4 100644
--- a/package/prelink-cross/prelink-cross.mk
+++ b/package/prelink-cross/prelink-cross.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRELINK_CROSS_VERSION = 440c0059a21f06b5577499a80b55482cb99d6d1c
+PRELINK_CROSS_VERSION = ff2561c02ade96c5d4d56ddd4e27ff064840a176
 PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
 PRELINK_CROSS_SITE_METHOD = git
 PRELINK_CROSS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
