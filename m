Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AD1C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B30160B33;
	Sat, 29 Oct 2022 16:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B30160B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id op8ubKsu47lx; Sat, 29 Oct 2022 16:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A34660640;
	Sat, 29 Oct 2022 16:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A34660640
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 886D71BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63895813D1
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63895813D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eugqw3KAE-Sn for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 891768138E
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891768138E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E708742E; Sat, 29 Oct 2022 16:23:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:18:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8acac82278fe3899fdaeff324e405baa4390e951
X-Git-Newrev: 376203a34e9851acaef1fcdff38aae1df89d50f9
X-Patchwork-Hint: ignore
Message-Id: <20221029162315.77E708742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/conntrack-tools: bump to version
 1.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=376203a34e9851acaef1fcdff38aae1df89d50f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://netfilter.org/pub/conntrack-tools/changes-conntrack-tools-1.4.7.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/conntrack-tools.hash | 2 +-
 package/conntrack-tools/conntrack-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index dd4fc168bc..371ede3432 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256  590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f  conntrack-tools-1.4.6.tar.bz2
+sha256  099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d  conntrack-tools-1.4.7.tar.bz2
 # Locally calculated
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 55ea407924..ec633f0d54 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.6
+CONNTRACK_TOOLS_VERSION = 1.4.7
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
