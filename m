Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC56DC43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A513415B5;
	Sat,  2 Jul 2022 13:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A513415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65HS1ryUCws7; Sat,  2 Jul 2022 13:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCBAA415B1;
	Sat,  2 Jul 2022 13:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCBAA415B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A9801BF962
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC02409E9
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC02409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Epx2woCb0RG0 for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7363F415B5
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7363F415B5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6743887880; Sat,  2 Jul 2022 13:39:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:49:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2f743f38fc60fca8c598a1f2dd9eb4d84473293
X-Git-Newrev: 7186fdb51f8219fc9ec0965c05cbfdbddf6ed033
X-Patchwork-Hint: ignore
Message-Id: <20220702133939.6743887880@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshfs: bump to version 3.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7186fdb51f8219fc9ec0965c05cbfdbddf6ed033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libfuse/sshfs/blob/sshfs-3.7.3/ChangeLog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sshfs/sshfs.hash | 2 +-
 package/sshfs/sshfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 106f06f09f..9372e471c2 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  fe5d3436d61b46974889e0c4515899c21a9d67851e3793c209989f72353d7750  sshfs-3.7.1.tar.xz
+sha256  5218ce7bdd2ce0a34137a0d7798e0f6d09f0e6d21b1e98ee730a18b0699c2e99  sshfs-3.7.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 6759f6ab3b..61f11af55f 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 3.7.1
+SSHFS_VERSION = 3.7.3
 SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
