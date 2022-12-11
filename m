Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED12EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A96814B3;
	Sun, 11 Dec 2022 13:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A96814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_6kNAD6wfov; Sun, 11 Dec 2022 13:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99C881493;
	Sun, 11 Dec 2022 13:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D99C881493
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07CD71BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D720281493
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D720281493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axnG1swPYhjZ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:14:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F898148B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F898148B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FC968609C; Sun, 11 Dec 2022 13:14:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:09:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 953e2889734d1ccac609f997e0f3ebdeee20c41b
X-Git-Newrev: f39ac8336e9cd933de50970a657e32a8d9601c67
X-Patchwork-Hint: ignore
Message-Id: <20221211131405.9FC968609C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: bump to version 0.32.4
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
