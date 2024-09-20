Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE2DC78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F07642C56;
	Fri, 20 Sep 2024 10:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGqyWzVYePm5; Fri, 20 Sep 2024 10:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F4442C67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F4442C67;
	Fri, 20 Sep 2024 10:35:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04081BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C1984C42
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7x8dx0kjvxAO for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4353A84C32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4353A84C32
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EACC82386; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:34:04 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cf62d1a1ecead7a4f3ff9cc68b68c75f26784d7d
X-Git-Newrev: 849af6337f6a0a1ea1ebd508625c9e6e6d7d18ac
X-Patchwork-Hint: ignore
Message-Id: <20240920103452.3EACC82386@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mrouted: fix
 typos and grammar
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

commit: https://git.buildroot.net/buildroot/commit/?id=849af6337f6a0a1ea1ebd508625c9e6e6d7d18ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Federico Pellegrin <fede@evolware.org>
[yann.morin.1998@free.fr: s/is/are/ (noticed by Federico)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 271ea8be96abf1b30b999075500aaf91f992c25c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mrouted/Config.in  | 3 ++-
 package/mrouted/mrouted.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 95b4fb3825..de99303bfa 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MROUTED
 	  source. This package comes with mrouted and mroutectl.  Where
 	  the latter is used to query status and control operation.
 
-	  Note: at least two interfaces with MULTICAST flag is requried.
+	  Note: at least two interfaces with MULTICAST flag are
+	  required.
 
 	  http://github.com/troglobit/mrouted
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 0d2071c4f0..7b5f5039f6 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -23,7 +23,7 @@ define MROUTED_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
 endef
 
-# We will asume that CONFIG_NET and CONFIG_INET are already
+# We will assume that CONFIG_NET and CONFIG_INET are already
 # set in the kernel configuration provided by the user.
 define MROUTED_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
