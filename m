Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EE0C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FAF611C7;
	Thu, 29 Sep 2022 21:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63FAF611C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-rc_QfOEFbY; Thu, 29 Sep 2022 21:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E85611C1;
	Thu, 29 Sep 2022 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E85611C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317031C2744
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18F4141C36
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F4141C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cvm9sypHpQf for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:20:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2E341C52
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2E341C52
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D000F8657A; Thu, 29 Sep 2022 21:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 23:07:22 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6ff6d691288904a488ff2e39bdfa8d441c7c614e
X-Git-Newrev: 2f7b664a9361effe18d42782feb115e8eb63eaa4
X-Patchwork-Hint: ignore
Message-Id: <20220929212027.D000F8657A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: add Giulio
 Benetti to package qt5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f7b664a9361effe18d42782feb115e8eb63eaa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e385856f4312078c418bbc071865592bf3df44ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d6cbd2280b..53f99928da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1102,6 +1102,7 @@ F:	package/minicom/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
+F:	package/qt5/
 F:	package/rockchip-mali/
 F:	package/rtl8189es/
 F:	package/rtl8723bu/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
