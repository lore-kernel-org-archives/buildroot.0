Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A8AC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920D74086A;
	Sun, 16 Oct 2022 15:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920D74086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dc9o1sD1W_d8; Sun, 16 Oct 2022 15:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A4F4058C;
	Sun, 16 Oct 2022 15:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A4F4058C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74BBC1BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E7081D3D
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E7081D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrStwrq96ZJy for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:06:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8282781A18
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8282781A18
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68BA686785; Sun, 16 Oct 2022 15:06:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:05:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7c5529e9c080e4f860ef3276aa9ed9e01b3fa42
X-Git-Newrev: e451f1a578d1629ac1e6cf1e61bc8fcead0910d3
X-Patchwork-Hint: ignore
Message-Id: <20221016150659.68BA686785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agent-proxy: fix
 AGENT_PROXY_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=e451f1a578d1629ac1e6cf1e61bc8fcead0910d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make AGENT_PROXY_VERSION compliant with release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agent-proxy/agent-proxy.hash | 2 +-
 package/agent-proxy/agent-proxy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/agent-proxy/agent-proxy.hash b/package/agent-proxy/agent-proxy.hash
index bd0e814d20..685dd4fbaf 100644
--- a/package/agent-proxy/agent-proxy.hash
+++ b/package/agent-proxy/agent-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4db014339b5bbdae3d98e814844e1b80d87b663a343f7d33fdb89fdbb02f16d  agent-proxy-agent-proxy-1.97-br1.tar.gz
+sha256  b1667b36074c10ebd6dd1f89eda75d5877bc8e06ecf2919f18e75a7a5a9de19b  agent-proxy-1.97.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/agent-proxy/agent-proxy.mk b/package/agent-proxy/agent-proxy.mk
index 46108aef02..c8844ccbf1 100644
--- a/package/agent-proxy/agent-proxy.mk
+++ b/package/agent-proxy/agent-proxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AGENT_PROXY_VERSION = agent-proxy-1.97
-AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+AGENT_PROXY_VERSION = 1.97
+AGENT_PROXY_SITE = https://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/snapshot
 AGENT_PROXY_LICENSE = GPL-2.0
 AGENT_PROXY_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
