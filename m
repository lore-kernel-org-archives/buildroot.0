Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8AFC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F4646B69;
	Mon, 20 Feb 2023 21:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F4646B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEKotx7xF4hQ; Mon, 20 Feb 2023 21:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99FA4700B;
	Mon, 20 Feb 2023 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99FA4700B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 120F11BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3D1B610E6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D1B610E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrN7BGK39PWg for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02217610DB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02217610DB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE6786495; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:20:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2cda2584fbb566284019f39ca89f44b42dacdb03
X-Git-Newrev: ecc33ec02a9c137387b9eb820e8e3b55b732d9b5
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.EEE6786495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/scanpypi: add
 LICENCE.TXT to the list of the license files
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecc33ec02a9c137387b9eb820e8e3b55b732d9b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 452b4a3fc3..3c98bb4bcc 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -487,7 +487,7 @@ class BuildrootPackage():
         lines = []
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
-                     'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
+                     'LICENCE.TXT', 'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
         self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
         lines.append(self.__get_license_names(self.license_files))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
