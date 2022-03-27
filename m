Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E862C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA684099B;
	Sun, 27 Mar 2022 15:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_y2hoieVy44; Sun, 27 Mar 2022 15:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B3540993;
	Sun, 27 Mar 2022 15:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9971BF9AA
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 331BF81C6F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHZEOx51dmdL for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8222C81D7C
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3084985D65; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2bc5e916beedc1965da2a7bf9a86e74b24a5562
X-Git-Newrev: d6c7772df9ada2782336e4e47209e2cc039252a9
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.3084985D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump to version 1.43.0-0
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
Content-Type: multipart/mixed; boundary="===============7406029933574453090=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7406029933574453090==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d6c7772df9ada2782336e4e47209e2cc039252a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 2fb2b5c4fc..4cdb91729f 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b6fbaa89d2420edf6070ad9e522993e132bd7eb2540ff754c2b9f1497744db2  luv-1.42.0-1.tar.gz
+sha256  567a6f3dcdcf8a9b54ddc57ffef89d1e950d72832b85ee81c8c83a9d4e0e9de2  luv-1.43.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 2dc9af3b7a..36fcdc742e 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.42.0-1
+LUV_VERSION = 1.43.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt

--===============7406029933574453090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7406029933574453090==--
