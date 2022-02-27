Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D46C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49E8408E1;
	Sun, 27 Feb 2022 17:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypvIoUR6kb64; Sun, 27 Feb 2022 17:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01646408DC;
	Sun, 27 Feb 2022 17:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4931BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A26181C93
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxaJYiyZv2VT for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E231B81BB2
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A74D182DFE; Sun, 27 Feb 2022 17:44:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:50:56 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 953e0595f8f1e6a1c94d612dcde0027f89014692
X-Git-Newrev: d5658ab951023d3f2a9a8bdd34de19a41e087bd1
X-Patchwork-Hint: ignore
Message-Id: <20220227174419.A74D182DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/thermald: update
 URL in the docs
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5658ab951023d3f2a9a8bdd34de19a41e087bd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Old project homepage was removed, so switch to github, already in use to
download the sources.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1ddced072abefa001a10df56b9820e96db1b2b6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thermald/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/thermald/Config.in b/package/thermald/Config.in
index f32a4b274e..8950e939b3 100644
--- a/package/thermald/Config.in
+++ b/package/thermald/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_THERMALD
 	  reaches a certain threshold, the Linux daemon activates
 	  various cooling methods to try to cool the system.
 
-	  https://01.org/linux-thermal-daemon
+	  https://github.com/intel/thermal_daemon
 
 comment "thermald needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
