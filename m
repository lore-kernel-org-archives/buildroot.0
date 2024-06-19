Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F48C2BBCA
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04988415C7;
	Wed, 19 Jun 2024 20:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJZEO8FN1EY4; Wed, 19 Jun 2024 20:10:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27BAD4157E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27BAD4157E;
	Wed, 19 Jun 2024 20:10:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA81D1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6C4C605FA
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-Fm5UkgQEEP for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9289A605C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9289A605C0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AC1C88025; Wed, 19 Jun 2024 20:09:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:08:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3fb7426413e6e479f32288f9bb3c10a058d99c1
X-Git-Newrev: b8ef8838f15eb881c1a300c7598af53ca9b64b90
X-Patchwork-Hint: ignore
Message-Id: <20240619200958.8AC1C88025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2024.23
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0232299632742629855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0232299632742629855==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b8ef8838f15eb881c1a300c7598af53ca9b64b90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 8e9e7230ea..9be642ef6f 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d329d6d1c885ec4d410ab8c5f93320ab603cef860311a6b392edd5b903039a81  qbee-agent-2024.09-go2.tar.gz
+sha256  1f77442186f29fa7a0bdf1382334cb05f48af3f1b606e62b316f0a99618b5a9f  qbee-agent-2024.23-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index 30219eebdc..aba9edb824 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2024.09
+QBEE_AGENT_VERSION = 2024.23
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = c30d43b8e64cfef960cee9475b58ae083e4ad246
+QBEE_AGENT_COMMIT_ID = 3219c17730eab4c80598494732b4bed4c4c18b51
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============0232299632742629855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0232299632742629855==--
