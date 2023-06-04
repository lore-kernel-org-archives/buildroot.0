Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A2C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B17F4031C;
	Fri,  9 Jun 2023 16:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B17F4031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6apu-W6zlga; Fri,  9 Jun 2023 16:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A215741A3C;
	Fri,  9 Jun 2023 16:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A215741A3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06AE61BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F413419F1
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F413419F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQPHGibdZRVy for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:13:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB651419F4
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB651419F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7DC082631; Fri,  9 Jun 2023 16:13:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jun 2023 12:52:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b26999abca4e9fb4c2050123af028b80fa0c990
X-Git-Newrev: 108bb3395b5ed2abe1c3c5a20fb9205dfc672b54
X-Patchwork-Hint: ignore
Message-Id: <20230609161307.A7DC082631@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/z3: bump to version 4.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=108bb3395b5ed2abe1c3c5a20fb9205dfc672b54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v4.12.1, see:
- https://github.com/Z3Prover/z3/releases/tag/z3-4.12.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index 8a511c3fe5..bddf3066ba 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3735fabf00e1341adcc70394993c05fd3e2ae167a3e9bb46045e33084eb64a3  z3-4.12.1.tar.gz
+sha256  9f58f3710bd2094085951a75791550f547903d75fe7e2fcb373c5f03fc761b8f  z3-4.12.2.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 45c412ad12..501d9ee61a 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.1
+Z3_VERSION = 4.12.2
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
