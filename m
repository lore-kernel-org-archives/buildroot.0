Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC0C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379DC41603;
	Sun,  3 Dec 2023 17:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379DC41603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4mqnSYxGenA; Sun,  3 Dec 2023 17:16:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACE641600;
	Sun,  3 Dec 2023 17:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACE641600
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30231BF328
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC02741600
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC02741600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dOLUNuwzk8zX for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE91415FD
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE91415FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA55787811; Sun,  3 Dec 2023 17:16:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 18:15:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f1de35e2a0ea2496a920d0b28b5986ffb50f0640
X-Git-Newrev: a9d03feed642a860c11122a0b0ab32365201fc40
X-Patchwork-Hint: ignore
Message-Id: <20231203171610.DA55787811@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi/readme.txt:
 add pi0w hint
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
Content-Type: multipart/mixed; boundary="===============6521533483535940259=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6521533483535940259==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a9d03feed642a860c11122a0b0ab32365201fc40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index c81fd801ae..ebcf8da588 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -28,6 +28,10 @@ For model Zero (model A+ in smaller form factor):
 
   $ make raspberrypi0_defconfig
 
+or for model Zero W (model Zero with wireless LAN and Bluetooth):
+
+  $ make raspberrypi0w_defconfig
+
 For model Zero 2 W (model B3 in smaller form factor):
 
   $ make raspberrypizero2w_defconfig

--===============6521533483535940259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6521533483535940259==--
