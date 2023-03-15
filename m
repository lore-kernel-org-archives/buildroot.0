Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B8C74A5B
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DE141B40;
	Thu, 16 Mar 2023 21:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00DE141B40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6cJYtx-EEmm; Thu, 16 Mar 2023 21:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C01D541B24;
	Thu, 16 Mar 2023 21:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01D541B24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 870491BF97E
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E749820C1
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E749820C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FWGQlDca38S for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C6C820C0
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C6C820C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95C3E8747C; Thu, 16 Mar 2023 21:35:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 18:17:28 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 441dcb4a9bc33f825e0f626bc57ec7cb05d73ad6
X-Git-Newrev: 94cef87272660246c4237a6416f7694e85bb7113
X-Patchwork-Hint: ignore
Message-Id: <20230316213546.95C3E8747C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/bridge-utils:
 update project URL in Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=94cef87272660246c4237a6416f7694e85bb7113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The old URL no longer works and shows "No repositories found".
Replace it with:
https://wiki.linuxfoundation.org/networking/bridge

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit e8ad4f2d07462d8b022643c663e0fd7e9c7b5201)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bridge-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bridge-utils/Config.in b/package/bridge-utils/Config.in
index de5883f063..2d886e2cb0 100644
--- a/package/bridge-utils/Config.in
+++ b/package/bridge-utils/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_BRIDGE_UTILS
 	  added. Instead use the bridge command from the iproute2
 	  package which supports more features.
 
-	  https://git.kernel.org/cgit/linux/kernel/git/shemminger/bridge-utils.git/
+	  https://wiki.linuxfoundation.org/networking/bridge
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
