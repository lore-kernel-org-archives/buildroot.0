Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B2C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD57E403A7;
	Sun,  9 Apr 2023 14:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD57E403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uflyEDAUJXlZ; Sun,  9 Apr 2023 14:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB1844032A;
	Sun,  9 Apr 2023 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1844032A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 533941C2E2E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3FA82147
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3FA82147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmZ4D9UncUcX for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A1C82142
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A1C82142
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5226383B3F; Sun,  9 Apr 2023 14:01:02 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 15:58:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15a649fd2dc0f950f0237802223ddb3ebd752da9
X-Git-Newrev: c3c3fe141f028d06b32945f07cec7d2ecd60438c
X-Patchwork-Hint: ignore
Message-Id: <20230409140102.5226383B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ima-evm-utils: bump version to 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3c3fe141f028d06b32945f07cec7d2ecd60438c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Project primary git repository moved to github.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ima-evm-utils/ima-evm-utils.hash | 5 ++---
 package/ima-evm-utils/ima-evm-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 56d830e54c..9777c7f213 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,3 @@
-# sha1 from sourceforge, sha256 locally computed
-sha1  f23d8a406759a469b0223b0bfb302ada4407a1d1  ima-evm-utils-1.4.tar.gz
-sha256  fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
+# https://github.com/mimizohar/ima-evm-utils/releases/download/v1.5/ima-evm-utils-1.5.tar.gz.sha256
+sha256  45f1caa3ad59ec59a1d6a74ea5df38c413488cd952ab62d98cf893c15e6f246d  ima-evm-utils-1.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 01984402ce..b969b4709e 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.4
-IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
+IMA_EVM_UTILS_VERSION = 1.5
+IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
 IMA_EVM_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
