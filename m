Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A600E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 901D184C9B;
	Fri,  6 Sep 2024 20:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD21qMIC_DsD; Fri,  6 Sep 2024 20:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65CF184C8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65CF184C8F;
	Fri,  6 Sep 2024 20:08:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9271BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 649AC61101
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C_lMiZEcieb for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C37760DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C37760DFD
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68E5D86587; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:28:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31bcb608f520cdf0e940c10f71de4353f3a54acb
X-Git-Newrev: 91327d8c7272f0fb881c67b8bf416446ac3dbf3e
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.68E5D86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-yconf: bump version to
 1.0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=91327d8c7272f0fb881c67b8bf416446ac3dbf3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-p1-yconf/erlang-p1-yconf.hash | 2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
index 25d873b58a..dc2ac9937e 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.hash
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0280358c868977105104cfffa7b1fa2c5bf7856243cee9b7df974dc54904e4da  erlang-p1-yconf-1.0.15.tar.gz
+sha256  0f33a381cc580dc43284581e61e531293d1d358e35a32e51b8b4fda7b462eba1  erlang-p1-yconf-1.0.16.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index bc72f282a9..297ab20bb2 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YCONF_VERSION = 1.0.15
+ERLANG_P1_YCONF_VERSION = 1.0.16
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
