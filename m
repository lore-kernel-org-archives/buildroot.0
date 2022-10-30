Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39D0ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875A64031B;
	Sun, 30 Oct 2022 15:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875A64031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IeXOjcU9nkz; Sun, 30 Oct 2022 15:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F44E40292;
	Sun, 30 Oct 2022 15:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F44E40292
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4241BF47A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 174F6605AC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174F6605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWeVRh_9SX3C for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CC32605AE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC32605AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ADB68753A; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 16:56:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9e51e1150f59962577358b3da5c390ca4749291
X-Git-Newrev: bed463a46f2b1949f66947b5cf1caa04ce9b6f0f
X-Patchwork-Hint: ignore
Message-Id: <20221030155749.2ADB68753A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matio: bump to version 1.5.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=bed463a46f2b1949f66947b5cf1caa04ce9b6f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/tbeu/matio/releases/tag/v1.5.23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matio/matio.hash | 4 ++--
 package/matio/matio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 4634074ca0..94e0e48f69 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.22/
-sha512  33fd3991413e94dfc9aba13ffd08b09ddcbdb9dfa579124d981449e195a8c61a3dc95b55e46bba360d48456c117cf36403af1c3448689c26b8aea5fa9cf38323  matio-1.5.22.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.23/
+sha512  e125278dcb25695affb7c576d0e2a86c0eff4225aa866b81536c9e4d7b2aea2c554f5389e96d534a8b559f5554b6cbecff4b44fe8915173cd64b2da6d1dc2629  matio-1.5.23.tar.gz
 # Locally computed
 sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index d282852d37..5e09f4e6ce 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.22
+MATIO_VERSION = 1.5.23
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
