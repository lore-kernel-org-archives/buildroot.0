Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15019E82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77B2428CC;
	Wed, 27 Sep 2023 19:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77B2428CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsOExQ4zhoeQ; Wed, 27 Sep 2023 19:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3F5428D9;
	Wed, 27 Sep 2023 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3F5428D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 938121BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66DB2419B4
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66DB2419B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4nq6tbu6HcK for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C15A401E1
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C15A401E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A6D482641; Wed, 27 Sep 2023 19:05:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:02:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dc3d3c36063b4ef7a76badc0db2a60786eafee9
X-Git-Newrev: 1c7d532ee9a9a4c9882412cfda7447df28fc3884
X-Patchwork-Hint: ignore
Message-Id: <20230927190533.7A6D482641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.8.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c7d532ee9a9a4c9882412cfda7447df28fc3884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index b6b183c2d1..ccc3c2c205 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.5.tar.gz.sha256sum
-sha256  6957cfd14a29eee7555c52f8387a46f2ce2f5fe7dadf93547f1bc74b1657e119  tor-0.4.8.5.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.6.tar.gz.sha256sum
+sha256  552d895fcaf66c7cd2b50f5abe63b7884b30fed254115be7bfb9236807355088  tor-0.4.8.6.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e86fec29f4..8e31ca749b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.5
+TOR_VERSION = 0.4.8.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
