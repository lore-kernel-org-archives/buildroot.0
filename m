Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F632C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE9B81EB3;
	Sun, 15 Jan 2023 21:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE9B81EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQK8AOFFHoRc; Sun, 15 Jan 2023 21:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3AF581EB6;
	Sun, 15 Jan 2023 21:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3AF581EB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77481BF3EA
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C362781EB6
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C362781EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6jWaZqDTGgA for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 032EE81EB3
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032EE81EB3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E574187B81; Sun, 15 Jan 2023 21:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:31:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e8d86b9a952181b5bc7ebf44d1f816315d0bd0aa
X-Git-Newrev: a3f588969590fdd9bf372d93a1767819f54d2664
X-Patchwork-Hint: ignore
Message-Id: <20230115210241.E574187B81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tor: bump version
 to 0.4.7.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3f588969590fdd9bf372d93a1767819f54d2664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog:
https://gitlab.torproject.org/tpo/core/tor/-/blob/main/ChangeLog?expanded=true&viewer=simple

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8b8c1f832b88b10efac754bb3e011a2e929bb5a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dba08f51b5..2a2953dc29 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.10.tar.gz.sha256sum
-sha256  647e56dfa59ea36dab052027fcfc7663905c826c03509363c456900ecd435a5b  tor-0.4.7.10.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.12.tar.gz.sha256sum
+sha256  3b5d969712c467851bd028f314343ef15a97ea457191e93ffa97310b05b9e395  tor-0.4.7.12.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index ed3714f2db..6812005618 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.10
+TOR_VERSION = 0.4.7.12
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
