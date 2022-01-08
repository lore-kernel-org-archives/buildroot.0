Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF852C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4658E60A93;
	Sat,  8 Jan 2022 17:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgWsElUlH9do; Sat,  8 Jan 2022 17:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DF160B02;
	Sat,  8 Jan 2022 17:28:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 097A71BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD89408B6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rx7gwksflXZ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:28:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA1C408B2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2F0708324A; Sat,  8 Jan 2022 17:22:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:28:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1a48f1bac19ac679803353bd048d91d02ffd75d
X-Git-Newrev: 59bbe7cc7418d61a5d2963f1d30e558c3111a95e
X-Patchwork-Hint: ignore
Message-Id: <20220108172225.2F0708324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libeastl: drop duplicated sentence
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

commit: https://git.buildroot.net/buildroot/commit/?id=59bbe7cc7418d61a5d2963f1d30e558c3111a95e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop duplicated sentence from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libeastl/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 7609434519..5abea8f810 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  EASTL stands for Electronic Arts Standard Template
-	  Library. EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
 	  algorithms, and iterators useful for runtime and tool
 	  development across multiple platforms.  It is an extensive
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
