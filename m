Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64785C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3609A61045;
	Wed, 10 Jul 2024 21:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzxWk_jxP7DX; Wed, 10 Jul 2024 21:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DCC660885
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DCC660885;
	Wed, 10 Jul 2024 21:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D92031BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C400540249
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAucJwWLp6vM for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9AF340126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9AF340126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:07:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1F4A846EC; Wed, 10 Jul 2024 21:07:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:07:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e50c5d54c381195852adf2e18f5c6c423dd90dac
X-Git-Newrev: 5778d9209c57fd19651f7493a74d20de8ab68ff9
X-Patchwork-Hint: ignore
Message-Id: <20240710210724.D1F4A846EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafnode2: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=5778d9209c57fd19651f7493a74d20de8ab68ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leafnode2/leafnode2.hash | 2 +-
 package/leafnode2/leafnode2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index d03ea472b1..8ab57c93c7 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1c74de60c3f91ef6f8a3ec20f0c34a0933658aeac8e3723a5f286c0646319e5c  leafnode2-ce7d3b13fb285c9fb7bffc382ea10fd41e12582d.tar.gz
+sha256  2a72a405599cd9f01cd44b6655c8986bf589b1f766c32957a70c147e39177a30  leafnode2-c514997a8c50bd28a34893d0436b0330f5719238.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index cba6b1f72a..71b27f180c 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = ce7d3b13fb285c9fb7bffc382ea10fd41e12582d
+LEAFNODE2_VERSION = c514997a8c50bd28a34893d0436b0330f5719238
 LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
