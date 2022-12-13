Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EDDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0025F60FC6;
	Tue, 13 Dec 2022 20:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0025F60FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1isypKfHKzbu; Tue, 13 Dec 2022 20:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD2960FE9;
	Tue, 13 Dec 2022 20:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DD2960FE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20E8D1BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F139340332
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F139340332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDzhSlAbX-Bw for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E8B403C9
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E8B403C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 711A28663F; Tue, 13 Dec 2022 20:22:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:12:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a182f3a7edcaf771d350604abc132e157b47f7ee
X-Git-Newrev: 8b8c1f832b88b10efac754bb3e011a2e929bb5a2
X-Patchwork-Hint: ignore
Message-Id: <20221213202218.711A28663F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.7.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b8c1f832b88b10efac754bb3e011a2e929bb5a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.torproject.org/tpo/core/tor/-/blob/main/ChangeLog?expanded=true&viewer=simple

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
