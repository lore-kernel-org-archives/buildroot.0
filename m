Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C665C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E34C94012A;
	Sat,  8 Jan 2022 15:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEnfzx3GqTfE; Sat,  8 Jan 2022 15:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E771540103;
	Sat,  8 Jan 2022 15:18:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A928F1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D16814A0
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0mWuw-ya216 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBCF58149D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 665A082DEE; Sat,  8 Jan 2022 15:09:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359
X-Git-Newrev: af1781844f853c0875093f1c71fd8dc8142fa3be
X-Patchwork-Hint: ignore
Message-Id: <20220108150928.665A082DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev/: bump version to 3.2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=af1781844f853c0875093f1c71fd8dc8142fa3be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch upstream URL to github due to changes in project ownership:
https://github.com/eudev-project/eudev/commit/06ac38e2b876427dfa2ef47e74b46b99927dfe34

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/eudev/Config.in  | 2 +-
 package/eudev/eudev.hash | 4 +---
 package/eudev/eudev.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 0e5bd0cee9..6e7bbe4648 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_EUDEV
 	  Upstart, older kernels, various toolchains and anything else
 	  required by users and various distributions.
 
-	  https://wiki.gentoo.org/wiki/Project:Eudev
+	  https://github.com/eudev-project/eudev
 
 if BR2_PACKAGE_EUDEV
 
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index fda0481351..fe6c7ef008 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,3 @@
-# From http://dev.gentoo.org/~blueness/eudev/
-md5  60b135a189523f333cea5f71a3345c8d  eudev-3.2.10.tar.gz
 # Locally calculated
-sha256  87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034  eudev-3.2.10.tar.gz
+sha256  19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b  eudev-3.2.11.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 5d18b388c7..705370689d 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.10
-EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
+EUDEV_VERSION = 3.2.11
+EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
