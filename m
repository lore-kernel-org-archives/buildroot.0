Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5A983F49;
	Sun, 24 Jul 2022 09:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5A983F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VE1N9MmEs26q; Sun, 24 Jul 2022 09:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE0A83F3C;
	Sun, 24 Jul 2022 09:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE0A83F3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6F61BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6894283F47
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6894283F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1_hSNuoRB_o for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E70B83F3C
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E70B83F3C
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CCF34856A8; Sun, 24 Jul 2022 09:05:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 10:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f3131296484767f037d3535ab69f328e94351db
X-Git-Newrev: 48ff8d5a71fa7eb11cc882e9061cbadb6a460e13
X-Patchwork-Hint: ignore
Message-Id: <20220724090529.CCF34856A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcg729: bump version to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=48ff8d5a71fa7eb11cc882e9061cbadb6a460e13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/BelledonneCommunications/bcg729/blob/master/CHANGELOG.md

Updated license to GPL-3.0+:
https://github.com/BelledonneCommunications/bcg729/commit/2c3ff1ae1af9b1571e3e8644c067965def39b747

License file was changed to LICENSE.txt:
https://github.com/BelledonneCommunications/bcg729/commit/089bb3454409d2cd630a6b3890a602b084e7ca89

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bcg729/bcg729.hash | 4 ++--
 package/bcg729/bcg729.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
index 4dbfbbbbb2..2eb80a0407 100644
--- a/package/bcg729/bcg729.hash
+++ b/package/bcg729/bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b  bcg729-1.0.4.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
index 426cfd90af..f89e535546 100644
--- a/package/bcg729/bcg729.mk
+++ b/package/bcg729/bcg729.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-BCG729_VERSION = 1.0.4
+BCG729_VERSION = 1.1.1
 BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
-BCG729_LICENSE = GPL-2.0+
-BCG729_LICENSE_FILES = COPYING
+BCG729_LICENSE = GPL-3.0+
+BCG729_LICENSE_FILES = LICENSE.txt
 BCG729_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
