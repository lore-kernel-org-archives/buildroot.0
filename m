Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D1C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031324ED14;
	Mon, 20 Feb 2023 22:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 031324ED14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dqE_qGAdTaW; Mon, 20 Feb 2023 22:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F084F1A8;
	Mon, 20 Feb 2023 22:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F084F1A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 716C81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B0A6115B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B0A6115B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oobph5X_s9xE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A399F611AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A399F611AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B9E38648F; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:09:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 953e2889734d1ccac609f997e0f3ebdeee20c41b
X-Git-Newrev: f39ac8336e9cd933de50970a657e32a8d9601c67
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.9B9E38648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neon: bump to version
 0.32.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f39ac8336e9cd933de50970a657e32a8d9601c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/notroj/neon/blob/0.32.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/neon/neon.hash | 2 +-
 package/neon/neon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 5a5a77a58b..9bd6195e39 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286  neon-0.32.2.tar.gz
+sha256  b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508  neon-0.32.4.tar.gz
 # Hash for license files
 sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index eae6bfbad6..1ce8f1ff16 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.32.2
+NEON_VERSION = 0.32.4
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
