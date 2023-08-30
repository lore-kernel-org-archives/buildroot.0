Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4475BC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E9F41BFF;
	Wed, 30 Aug 2023 11:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E9F41BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgtDZbIajzHk; Wed, 30 Aug 2023 11:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC09F41D7F;
	Wed, 30 Aug 2023 11:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC09F41D7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5F61BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72CEA822AD
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CEA822AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9KhRMY4q-z8 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 452EB822FB
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452EB822FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 431CC8655C; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:57:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5722d30644e42720201cf9d5f4cf52285c9d6b17
X-Git-Newrev: 135585ba23df556cd814f3fe49c4cc0e311dc108
X-Patchwork-Hint: ignore
Message-Id: <20230830110242.431CC8655C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/tor: bump version
 to 0.4.7.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=135585ba23df556cd814f3fe49c4cc0e311dc108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Changelog:
https://gitlab.torproject.org/tpo/core/tor/-/blob/release-0.4.7/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 361ff14457d6438e8b32a3566d60edb27a422ce5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 51892f15c3..a6b5f27c40 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.13.tar.gz.sha256sum
-sha256  2079172cce034556f110048e26083ce9bea751f3154b0ad2809751815b11ea9d  tor-0.4.7.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.14.tar.gz.sha256sum
+sha256  a5ac67f6466380fc05e8043d01c581e4e8a2b22fe09430013473e71065e65df8  tor-0.4.7.14.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 03bd998708..b794296c6a 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.13
+TOR_VERSION = 0.4.7.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
