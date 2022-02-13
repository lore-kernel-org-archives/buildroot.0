Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA61C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 003C140467;
	Sun, 13 Feb 2022 11:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqVzuuoJIqUY; Sun, 13 Feb 2022 11:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E37A74033F;
	Sun, 13 Feb 2022 11:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8B01BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 076E58128A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIm9qq9HeOC2 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6137481266
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 506AA821DB; Sun, 13 Feb 2022 11:06:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:11:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 616ba9c90b014637dc9925fa442a0af4a11f04b8
X-Git-Newrev: 968908b93ad6528dc7458442dabaceefd53ad4eb
X-Patchwork-Hint: ignore
Message-Id: <20220213110615.506AA821DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jo: bump to version 1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=968908b93ad6528dc7458442dabaceefd53ad4eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jpmens/jo/blob/1.6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jo/jo.hash | 2 +-
 package/jo/jo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index 8f1cc8fcd9..efad8228a7 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24c64d2eb863900947f58f32b502c95fec8f086105fd31151b91f54b7b5256a2  jo-1.4.tar.gz
+sha256  eb15592f1ba6d5a77468a1438a20e3d21c3d63bb7d045fb3544f223340fcd1a1  jo-1.6.tar.gz
 sha256  41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index 24b499f345..dd5dd03ddb 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.4
+JO_VERSION = 1.6
 JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
