Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE61FC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CEE541584;
	Wed, 19 Jun 2024 19:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-CClOrmJa3g; Wed, 19 Jun 2024 19:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0C441563
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F0C441563;
	Wed, 19 Jun 2024 19:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AE2B1BF951
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078F760665
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWlcIe2cauHO for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 19:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD2C60639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD2C60639
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 19:34:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE9738800F; Wed, 19 Jun 2024 19:34:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 21:29:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bfea9372f1842279a8f57b5fc4428bbae822e91
X-Git-Newrev: 27bec292f2ef2fc87ff4fa720cb9428a664122a5
X-Patchwork-Hint: ignore
Message-Id: <20240619193448.AE9738800F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: bump to version
 0.11.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=27bec292f2ef2fc87ff4fa720cb9428a664122a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/0.11.0.3

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
[Arnout: set hash for -cargo2 tarball instead of upstream one]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 8331f5cca4..559c9122ad 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c792f0be936ecbb3f759124be28950a01385f4680eaf4f1da55997640899648e  libzenoh-c-0.11.0.2-cargo2.tar.gz
+sha256  c86e468527e573d92b01bf454333dda4dc1217f14d5d5f94c24311961313c234  libzenoh-c-0.11.0.3-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index 3a50fe6bf1..07c153e328 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 0.11.0.2
+LIBZENOH_C_VERSION = 0.11.0.3
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
