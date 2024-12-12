Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198CEE7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F1D61AF8;
	Thu, 12 Dec 2024 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq2BTOjh6PIZ; Thu, 12 Dec 2024 21:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E4E703A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E4E703A5;
	Thu, 12 Dec 2024 21:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 139DF75
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D56E84A92
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uDBpqcl-EP5 for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF1684A8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF1684A8E
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CD0B86ED4; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:19:09 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 996554d0bcd89bf3b62b4d7a621fd358a373fb0b
X-Git-Newrev: f1a9811a4520d3f920d9528d3637c9c3f3657eb8
X-Patchwork-Hint: ignore
Message-Id: <20241212213338.0CD0B86ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/vdr-plugin-vnsiserver: fix 'several' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1a9811a4520d3f920d9528d3637c9c3f3657eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 34c671688741410a4eb4d83b38874dee00e9ebb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vdr-plugin-vnsiserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr-plugin-vnsiserver/Config.in b/package/vdr-plugin-vnsiserver/Config.in
index 0a0ab8d376..7100b2432c 100644
--- a/package/vdr-plugin-vnsiserver/Config.in
+++ b/package/vdr-plugin-vnsiserver/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_VDR_PLUGIN_VNSISERVER
 	depends on BR2_PACKAGE_VDR
 	help
 	  VDR plugin to handle KODI clients.
-	  The vdr-plugin-vnsiserver is able to handle serveral KODI
+	  The vdr-plugin-vnsiserver is able to handle several KODI
 	  clients connecting via the VNSI addon.
 
 	  https://github.com/FernetMenta/vdr-plugin-vnsiserver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
