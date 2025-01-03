Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC9E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 19:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A2A60B36;
	Fri,  3 Jan 2025 19:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud65qaBDIDmZ; Fri,  3 Jan 2025 19:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A5A26083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5A26083A;
	Fri,  3 Jan 2025 19:13:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C17F27
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A64CB40481
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsI67sJy3xJV for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 19:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8387404C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8387404C4
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:13:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE3FF838CD; Fri,  3 Jan 2025 19:13:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 20:07:59 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 2cd0716c56e97199ff63dec38c71ca4b05a63bbf
X-Git-Newrev: ccf579e731f5fd7f7e23af3f0a2606c1e324ec91
X-Patchwork-Hint: ignore
Message-Id: <20250103191340.BE3FF838CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/qt6/qt6opcua: fix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ccf579e731f5fd7f7e23af3f0a2606c1e324ec91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6beee86c0d953dd67549d27c1f684132bc052a31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
