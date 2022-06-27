Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F4AC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF1304159A;
	Mon, 27 Jun 2022 22:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1304159A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9H0rgkhOtq_S; Mon, 27 Jun 2022 22:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3780141581;
	Mon, 27 Jun 2022 22:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3780141581
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E81DE1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A3C60A7D
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A3C60A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UALusD2jriW5 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 082C660A6F
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 082C660A6F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BA1A876A7; Mon, 27 Jun 2022 22:13:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:24:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 282d6982413aba2fc96fe2e337741424e5fe3dc5
X-Git-Newrev: 04b030c21fd146bbe221c50801709d9394a4cde4
X-Patchwork-Hint: ignore
Message-Id: <20220627221345.9BA1A876A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nilfs-utils: bump to version 2.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=04b030c21fd146bbe221c50801709d9394a4cde4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/nilfs-dev/nilfs-utils/blob/v2.2.9/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nilfs-utils/nilfs-utils.hash | 4 ++--
 package/nilfs-utils/nilfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index ad6a57d8f5..ec71751b00 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512	3232390581f63de5ebe7b461b178a40dfbdaa4bc6aa96b218ea8182c5bf81b162a1e632a1c21d9f1e89fdba9393b4e268e001c335a99ce22f645a62ae3154783  nilfs-utils-2.2.8.tar.bz2
-sha512	4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
+sha512  dd8ab20ee0d6750a6d81f86fe4d1ad94a8a71aa53ee7cd38550ea32fffcc9527db1c75d34f732f0f8f6379a808249f8eec2619e54c595566a3fc434a87d9e66d  nilfs-utils-2.2.9.tar.bz2
+sha512  4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 7335d87209..9f9bd091c3 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = 2.2.8
+NILFS_UTILS_VERSION = 2.2.9
 NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
