Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69393C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F466FC2D;
	Mon, 19 May 2025 11:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUdubh0nUhRq; Mon, 19 May 2025 11:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBE07116F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BBE07116F;
	Mon, 19 May 2025 11:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C15D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE79141E70
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0uvx_BHDSoN for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423E94238A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423E94238A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C5B681E90; Mon, 19 May 2025 10:40:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 13:56:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b020912353ce6362961ddcc27325d34cc68f0a1
X-Git-Newrev: 20f2b14b19180ac6309d03294d2897b8384d13a4
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.3C5B681E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qbee-agent: bump
 version to 2024.50
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
Content-Type: multipart/mixed; boundary="===============2117542768106676340=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2117542768106676340==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=20f2b14b19180ac6309d03294d2897b8384d13a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 156f911a6d..3c022b5167 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6dca3d020bc9f0f80f4c8c5b85c079a65707fb79485b39c85d9bd1cfadafcf9f  qbee-agent-2024.36-go2.tar.gz
+sha256  38379b0869d013fbd225d3e092fa16751c414b8f412437c1c4c7f3af118fee4b  qbee-agent-2024.50-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index 1a9653ee7f..c5df59a663 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2024.36
+QBEE_AGENT_VERSION = 2024.50
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = d52fb5e69b479550636570a2db6cebe06f5f129b
+QBEE_AGENT_COMMIT_ID = 4303465d155f0680968b57fdf4421971786356a4
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============2117542768106676340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2117542768106676340==--
