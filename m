Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA264C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EC57404AF;
	Mon,  5 Feb 2024 17:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EC57404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdK2Q4Rhx4EQ; Mon,  5 Feb 2024 17:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 616184023F;
	Mon,  5 Feb 2024 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616184023F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18BD41BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3EE34048E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EE34048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XleQw7pqKibx for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3B840135
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF3B840135
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBBC386D94; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a860f330a4ecd2fa442ea2a35e16c0f87611306
X-Git-Newrev: 19370420baa3d98f9e6fa041822d1fccf375f862
X-Patchwork-Hint: ignore
Message-Id: <20240205174221.BBBC386D94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlciper: bump to version 4.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=19370420baa3d98f9e6fa041822d1fccf375f862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (update in year:
https://github.com/sqlcipher/sqlcipher/commit/b942636547ad68b1c38053099e7e877b2495d4cc)

https://github.com/sqlcipher/sqlcipher/blob/v4.5.5/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.hash | 4 ++--
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index c655165172..7632c1c887 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  023499516ef2ade14fbcdbe93fb81cc69458ae6cb3544614df8dbef34835b406  sqlcipher-4.5.1.tar.gz
-sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
+sha256  014ef9d4f5b5f4e7af4d93ad399667947bb55e31860e671f0def1b8ae6f05de0  sqlcipher-4.5.5.tar.gz
+sha256  09e4af560ce2e3c9c2aa6b564e35947b03db7d1ae345f22a32793ed46542cc14  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index c0c53acdd2..8d062ccf81 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.5.1
+SQLCIPHER_VERSION = 4.5.5
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
