Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8D2E95A61
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 16:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE7F61060;
	Sat,  7 Oct 2023 16:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE7F61060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s1sydeHD6wm; Sat,  7 Oct 2023 16:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C41E261062;
	Sat,  7 Oct 2023 16:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C41E261062
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06C291BF31B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D42B640C2F
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 16:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D42B640C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9rq9R8VY8Xx for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 16:19:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD35E4029B
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 16:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD35E4029B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 986A6841CC; Sat,  7 Oct 2023 16:19:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Oct 2023 18:19:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cf183be9e660502af2ae7e3971ffc978cfec28b
X-Git-Newrev: 53d90b74f3ca7c258e6c34e768138703f5286345
X-Patchwork-Hint: ignore
Message-Id: <20231007161924.986A6841CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am62x-sk/readme.txt: fix
 defconfig target
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

commit: https://git.buildroot.net/buildroot/commit/?id=53d90b74f3ca7c258e6c34e768138703f5286345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

am62x_sk_defconfig should be ti_am62x_sk_defconfig

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/ti/am62x-sk/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/ti/am62x-sk/readme.txt b/board/ti/am62x-sk/readme.txt
index f6251ea04a..5af1c59c2d 100644
--- a/board/ti/am62x-sk/readme.txt
+++ b/board/ti/am62x-sk/readme.txt
@@ -11,7 +11,7 @@ How to Build
 
 Select the default configuration for the target:
 
-$ make am62x_sk_defconfig
+$ make ti_am62x_sk_defconfig
 
 Optional: modify the configuration:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
