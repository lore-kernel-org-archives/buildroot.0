Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D97EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:54:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD9361371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDD9361371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C694483BED;
	Tue,  5 Oct 2021 14:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiKZxCQ6bFCs; Tue,  5 Oct 2021 14:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A7183BE8;
	Tue,  5 Oct 2021 14:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD691BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F9F140860
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9KkiLiXPIt0 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450D64081D
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:54:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7546490F94; Tue,  5 Oct 2021 14:51:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 16:21:09 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c35e140dabcf9c2a2bc68775ce9c1abe55513b26
X-Git-Newrev: 8a617059fe15d7ea90f2bcfce6de3530ba3fc718
X-Patchwork-Hint: ignore
Message-Id: <20211005145141.7546490F94@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/sispmctl: bump to
 version 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a617059fe15d7ea90f2bcfce6de3530ba3fc718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Drop patch (already in version)

https://sourceforge.net/p/sispmctl/git/ci/release-4.9/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 63847a4b2e4e3ace65e6a2d6a4c7e62b62b29a29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-schedule.c-fix-build-with-gcc-4.8.patch | 56 ----------------------
 package/sispmctl/sispmctl.hash                     |  2 +-
 package/sispmctl/sispmctl.mk                       |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch b/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 69dc31e353..0000000000
--- a/package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3ccbb67c71aa13b9a37a58363d37a18b8fdbf300 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 29 Oct 2020 13:36:00 +0100
-Subject: [PATCH] src/schedule.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8:
-
-schedule.c:19:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < 4; ++i) {
-  ^
-schedule.c:19:2: note: use option -std=c99 or -std=gnu99 to compile your code
-schedule.c: In function 'pms2_read_block':
-schedule.c:39:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < 4; ++i) {
-  ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceforge.net/p/sispmctl/git/merge-requests/1]
----
- src/schedule.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/schedule.c b/src/schedule.c
-index 4dd908d..1725421 100644
---- a/src/schedule.c
-+++ b/src/schedule.c
-@@ -15,8 +15,9 @@
- static unsigned char
- *pms2_write_block(uint8_t action, uint32_t time, unsigned char *ptr)
- {
-+	int i;
- 	*ptr++ = action;	
--	for (int i = 0; i < 4; ++i) {
-+	for (i = 0; i < 4; ++i) {
- 		*ptr++ = (uint8_t)time;
- 		time >>= 8;
- 	}
-@@ -34,9 +35,10 @@ static unsigned char
- static const unsigned char
- *pms2_read_block(uint8_t *action, uint32_t *time, const unsigned char *ptr)
- {
-+	int i;
- 	*action = *ptr++;
- 	*time = 0;
--	for (int i = 0; i < 4; ++i) {
-+	for (i = 0; i < 4; ++i) {
- 		*time >>= 8;
- 		*time += (uint32_t)*ptr++ << 24;
- 	}
--- 
-2.28.0
-
diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index 95129cec03..e22efcfbed 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0f8391f7e95cbf1fb96a68686a1dcf1e16747b050ae1b8ff90653c99976068db  sispmctl-4.8.tar.gz
+sha256  6a9ec7125e8c01bb45d4a3b56f07fb41fc437020c8dcd8c0f29ebb98dc55a647  sispmctl-4.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index 3e4252a8d8..b6e156c66a 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 4.8
+SISPMCTL_VERSION = 4.9
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
