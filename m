Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639CEC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9E6612CE;
	Thu,  9 Mar 2023 20:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9E6612CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fj8-cv7BoZhL; Thu,  9 Mar 2023 20:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39FB961386;
	Thu,  9 Mar 2023 20:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39FB961386
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08BA71BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E436540483
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E436540483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuPdfajwqPOs for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:04:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17AAC403D6
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17AAC403D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0313C86B5C; Thu,  9 Mar 2023 20:04:55 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:03:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bec87810252d123f768af03e0e2ab53d2b61f03
X-Git-Newrev: e8ad4f2d07462d8b022643c663e0fd7e9c7b5201
X-Patchwork-Hint: ignore
Message-Id: <20230309200456.0313C86B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bridge-utils: update project URL
 in Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8ad4f2d07462d8b022643c663e0fd7e9c7b5201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old URL no longer works and shows "No repositories found".
Replace it with:
https://wiki.linuxfoundation.org/networking/bridge

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
