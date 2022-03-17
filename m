Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0B6847C6;
	Thu, 17 Mar 2022 21:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hkMscifdoXV; Thu, 17 Mar 2022 21:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 767128476A;
	Thu, 17 Mar 2022 21:39:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036C11BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC5E4048A
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVOSJYV3Jg8E for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:38:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17F3D40486
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9E7E4843FD; Thu, 17 Mar 2022 21:30:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 22:36:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fed7ed02858749641dbf21c645fcf44ce752b396
X-Git-Newrev: 05507efd1a791948a23036eb28eb7be0f4d1f4ef
X-Patchwork-Hint: ignore
Message-Id: <20220317213005.9E7E4843FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moby-buildkit: bump to version
 0.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=05507efd1a791948a23036eb28eb7be0f4d1f4ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/moby/buildkit/releases/tag/v0.10.0

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index 3015e479f6..cfd1c0c946 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
+sha256  5877faf02cbddfb6c988f44b5b373739fed87f4aeb8802c6777fe7be2f772506  moby-buildkit-0.10.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 3f0df351ef..d34ff96252 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.8.1
+MOBY_BUILDKIT_VERSION = 0.10.0
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
