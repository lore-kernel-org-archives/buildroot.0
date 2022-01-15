Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8F460BE9;
	Sat, 15 Jan 2022 09:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpCCokOCDA02; Sat, 15 Jan 2022 09:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B9BF607F9;
	Sat, 15 Jan 2022 09:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D79C61BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3CB0607F9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jw-9oMvuvF17 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:44:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0C1605E8
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:44:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 593DE82929; Sat, 15 Jan 2022 09:38:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:32:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e2ea0138161625322a61217ba3f8ef0d09779c7d
X-Git-Newrev: 7bfd519b796cb98c5d4eee2e2e251121689dd604
X-Patchwork-Hint: ignore
Message-Id: <20220115093824.593DE82929@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/containerd:
 security bump to version 1.5.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bfd519b796cb98c5d4eee2e2e251121689dd604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The eighth patch release for containerd 1.5 contains a mitigation for
CVE-2021-41190 as well as several fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.5.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fc24c5c30a4c933e81e67d92559b271396186e02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 594c56a819..f1a6709554 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a  containerd-1.5.7.tar.gz
+sha256  a41ab8d39393c9456941b477c33bb1b221a29b635f1c9a99523aab2f5e74f790  containerd-1.5.8.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index fdbd2bf3e6..cd975db274 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.7
+CONTAINERD_VERSION = 1.5.8
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
