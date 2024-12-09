Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9461AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65CE46FB48;
	Fri, 28 Feb 2025 16:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZPnHdfknZfM; Fri, 28 Feb 2025 16:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A1FD6FC22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1FD6FC22;
	Fri, 28 Feb 2025 16:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BCB68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFAFE424AD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMLeH6-PzzZN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC20B41957
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC20B41957
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F2782621; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a46343df311961a8efb2a5e75c179eaa40b9a59
X-Git-Newrev: 34c671688741410a4eb4d83b38874dee00e9ebb9
X-Patchwork-Hint: ignore
Message-Id: <20250228162935.B2F2782621@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vdr-plugin-vnsiserver:
 fix 'several' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=34c671688741410a4eb4d83b38874dee00e9ebb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
