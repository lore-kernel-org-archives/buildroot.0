Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1573FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 08:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECEE84E88;
	Thu, 27 Jan 2022 08:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWmVsH5OJsRM; Thu, 27 Jan 2022 08:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B177784E86;
	Thu, 27 Jan 2022 08:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7271BF8A8
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D986108F
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38mhiyTlFE7A for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 08:05:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CE3060F4B
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:05:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3FF3F82872; Thu, 27 Jan 2022 07:58:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:57:36 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 957a7ff5b65f6d34fe3fcdbc5ccc85c2c6511143
X-Git-Newrev: 2628dcdd4750e7988c4491a17d5c480d4240b81f
X-Patchwork-Hint: ignore
Message-Id: <20220127075831.3FF3F82872@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libss7: add Linux
 in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=2628dcdd4750e7988c4491a17d5c480d4240b81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e0de6291e3fe8d9f6c572a5206b8ead3719f6829)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libss7/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libss7/Config.in b/package/libss7/Config.in
index bdf5fbe3a8..d8bcf11ce7 100644
--- a/package/libss7/Config.in
+++ b/package/libss7/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBSS7
 
 	  http://www.asterisk.org/downloads/libss7
 
-comment "libss7 needs a kernel to be built"
+comment "libss7 needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 comment "libss7 needs a toolchain w/ threads"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
