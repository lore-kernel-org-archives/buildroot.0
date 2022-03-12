Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D178C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D72981AAD;
	Sat, 12 Mar 2022 19:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkfZJV179vV9; Sat, 12 Mar 2022 19:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE9881A50;
	Sat, 12 Mar 2022 19:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 453381BF966
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432EF40872
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hcomufm9EyLu for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C13F74087B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:44:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CE6A383A8D; Sat, 12 Mar 2022 19:35:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 20:44:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 691b1cebf56099e7f019281beb761c0b0fe4d5e0
X-Git-Newrev: 7e8635ba94bfb029584171a52d135db145ac7bf1
X-Patchwork-Hint: ignore
Message-Id: <20220312193555.CE6A383A8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono: bump to version 6.12.0.122
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e8635ba94bfb029584171a52d135db145ac7bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Arnout: use 2 spaces in hash file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mono/mono.hash | 8 ++++----
 package/mono/mono.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 2477e9231c..8b72ae68ed 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 51de5c02ad511333f93ff585bca54c8784de35af4ff27b759d16b46c4402cdac  mono-6.12.0.90.tar.xz
-sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
-sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
-sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
+sha256  29c277660fc5e7513107aee1cbf8c5057c9370a4cdfeda2fc781be6986d89d23  mono-6.12.0.122.tar.xz
+sha256  923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
+sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
+sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 27f7886224..219effc5d3 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.12.0.90
+MONO_VERSION = 6.12.0.122
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
