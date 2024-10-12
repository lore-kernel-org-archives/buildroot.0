Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4C3CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03DE606D5;
	Sat, 12 Oct 2024 15:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiAgZf9hKBiO; Sat, 12 Oct 2024 15:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB1060F71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB1060F71;
	Sat, 12 Oct 2024 15:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03E0F1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A09C8405C2
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dtf7F47jqq4 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC1B405D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BC1B405D4
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9825685CB0; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cda3a2e44964bc2026e2e50b0c30ed07ba851bb2
X-Git-Newrev: 26f24e2f7aaba8286e0de8295a0c95c0844bfabd
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.9825685CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/stress-ng: fix
 'correctly' typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=26f24e2f7aaba8286e0de8295a0c95c0844bfabd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Also fix conjugations of verbs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: fix additional typoes]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 3c4dd46791dfa7f599d132d2d6f00f3bf57fd081)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 24ec4cb515..1a3584b0d4 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -28,9 +28,9 @@ define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(STRESS_NG_MAKE_FLAGS)
 endef
 
-# Don't use make install otherwise stress-ng will be rebuild without
-# required link libraries if any. Furthermore, using INSTALL allow to
-# set the file permission correcly on the target.
+# Don't use make install otherwise stress-ng will be rebuilt without
+# required link libraries if any. Furthermore, using INSTALL allows to
+# set the file permission correctly on the target.
 define STRESS_NG_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/stress-ng $(TARGET_DIR)/usr/bin/stress-ng
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
