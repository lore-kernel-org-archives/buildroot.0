Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B314EECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66534842B0;
	Fri, 16 Sep 2022 11:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66534842B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhcdqlwwIOrq; Fri, 16 Sep 2022 11:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DACF3842A7;
	Fri, 16 Sep 2022 11:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DACF3842A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209361C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB5760F64
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFB5760F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTGMGJl_Y7Fj for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 256B561207
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 256B561207
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1377283CC3; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:15:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 57220d62683032908c5c2e76cca032f97c3e9d67
X-Git-Newrev: 0ccf43c02da5606778911e80ff557142a692bb4f
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.1377283CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcnano-binaries:
 fix typo on help
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ccf43c02da5606778911e80ff557142a692bb4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

libaries -> libraries

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6f1b338176c1f2b43016ba9c2a60d45a629a6bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcnano-binaries/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index ade19e2121..89f909f2c3 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_GCNANO_BINARIES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	help
-	  Driver and libaries for stm vivante gcnano gpu.
+	  Driver and libraries for stm vivante gcnano gpu.
 	  https://github.com/STMicroelectronics/gcnano-binaries/
 
 if BR2_PACKAGE_GCNANO_BINARIES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
