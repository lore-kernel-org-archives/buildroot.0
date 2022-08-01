Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C3DC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 22:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D88914017B;
	Mon,  1 Aug 2022 22:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88914017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmt8EIrNqA3H; Mon,  1 Aug 2022 22:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6554040194;
	Mon,  1 Aug 2022 22:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6554040194
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E53F91BF31F
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C001160675
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C001160675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZbjAXhjNzLo for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 22:18:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1684B60071
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 22:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1684B60071
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91F9A86C72; Mon,  1 Aug 2022 22:04:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Aug 2022 00:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88cac04de3c256cfdb629a181c5e0d5d4b3725c2
X-Git-Newrev: eda5590fa9fc647598e2a407612b4072ec8cb3cd
X-Patchwork-Hint: ignore
Message-Id: <20220801220447.91F9A86C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: fix link in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=eda5590fa9fc647598e2a407612b4072ec8cb3cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The page on Sourceforge says since 2015 that the project has moved to
https://github.com/vmware/open-vm-tools, so update the Config.in help
text link accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index a50b6b9b3e..c866b36569 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
-	  http://open-vm-tools.sourceforge.net/
+	  https://github.com/vmware/open-vm-tools
 
 	  ICU locales, Xerces, and X11 tools are currently not
 	  supported.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
