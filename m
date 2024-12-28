Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AD5C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F4040E33;
	Fri, 28 Feb 2025 16:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0Nm0Caxldvi; Fri, 28 Feb 2025 16:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92A0408D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92A0408D5;
	Fri, 28 Feb 2025 16:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0838B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96BE842DB4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dCMK5JDIRSK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983CC4256F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 983CC4256F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9001C8752B; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:32:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ffe409140b141cc500e269ef3640e9fdc7475723
X-Git-Newrev: 6beee86c0d953dd67549d27c1f684132bc052a31
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.9001C8752B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6opcua: fix
 'qt6opcua' typo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6beee86c0d953dd67549d27c1f684132bc052a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6opcua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
index 68b73f7c50..9b5359dd4c 100644
--- a/package/qt6/qt6opcua/Config.in
+++ b/package/qt6/qt6opcua/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT6OPCUA
 	bool "qt6opcua"
 	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
+	# qt6opcua needs host-qt6opcua, and host-qt6opcua needs
 	# network support in qt6base.
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
