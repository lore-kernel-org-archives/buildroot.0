Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729EBCCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9111A612B6;
	Sat,  1 Nov 2025 17:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpOFLQVp1Bws; Sat,  1 Nov 2025 17:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959DA612A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959DA612A4;
	Sat,  1 Nov 2025 17:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 724BC2A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EDE641F07
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYSzwG6BYAq6 for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42A140B45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B42A140B45
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:02:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF8BA836D2; Sat,  1 Nov 2025 17:02:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Nov 2025 17:43:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 801e2c6aa116ce092e60d4d1afde7d8171217127
X-Git-Newrev: 7b79f01e42f7df916384b70028d63741dd01abc9
X-Patchwork-Hint: ignore
Message-Id: <20251101170248.AF8BA836D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agentpp: bump version to 4.7.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b79f01e42f7df916384b70028d63741dd01abc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.agentpp.com//download/changes_agent++.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 7c94f4b1b0..6bde308027 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3287218cf6eaa3744b3788afd1e7d72e7a9508d45741243178404f6b47edd86f  agent++-4.6.1.tar.gz
+sha256  10542169c3cea8cb547a0b7a678d631eda6d0b4b0381dc84df4cf5d26905db13  agent++-4.7.2.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 3756d0ca28..fdd3d60859 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.6.1
+AGENTPP_VERSION = 4.7.2
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
