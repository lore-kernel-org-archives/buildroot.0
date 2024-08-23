Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E215C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD3C741244;
	Fri, 23 Aug 2024 16:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weg6VHeEcvo7; Fri, 23 Aug 2024 16:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A7040D5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A7040D5B;
	Fri, 23 Aug 2024 16:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7205B1BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CEB881EC6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEAH_qDxQGCs for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9949D81EC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9949D81EC3
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FB46863F5; Fri, 23 Aug 2024 16:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 18:39:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1d229b41b29b974b3e840f55b592fbc72d53ca92
X-Git-Newrev: 298d04680e353d8b6f58fc62f1f6926435a8f038
X-Patchwork-Hint: ignore
Message-Id: <20240823164536.8FB46863F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/exfatprogs: bump
 version to 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=298d04680e353d8b6f58fc62f1f6926435a8f038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/exfatprogs/exfatprogs/blob/1.2.5/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exfatprogs/exfatprogs.hash | 4 ++--
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 9f3100db7f..5ccad03ca2 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.2/exfatprogs-1.2.2.tar.xz.sha256
-sha256  61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a  exfatprogs-1.2.2.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.5/exfatprogs-1.2.5.tar.xz.sha256
+sha256  f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0  exfatprogs-1.2.5.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 40d9072571..a541a63116 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.2
+EXFATPROGS_VERSION = 1.2.5
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
