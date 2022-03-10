Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E648C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC3D940BB7;
	Thu, 10 Mar 2022 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9I8fjrTkHc_W; Thu, 10 Mar 2022 21:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A114140550;
	Thu, 10 Mar 2022 21:45:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2E7B1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0298605A4
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MU6AR4kKZXqO for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:45:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA41760B52
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5764983C36; Thu, 10 Mar 2022 21:36:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:44:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8368a375e2680399bc4cd04bf70ae2fceb899d58
X-Git-Newrev: 3fad951aaef52b86f93aef93efff69ea651fac28
X-Patchwork-Hint: ignore
Message-Id: <20220310213635.5764983C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/wireless-regdb:
 bump version to 2022.02.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fad951aaef52b86f93aef93efff69ea651fac28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog (since 2021.08.28, [1]):

  e061299 wireless-regdb: Raise DFS TX power limit to 250 mW (24 dBm) for the US
  2ce78ed wireless-regdb: Update regulatory rules for Croatia (HR) on 6GHz
  0d39f4c wireless-regdb: Update regulatory rules for South Korea (KR)
  acad231 wireless-regdb: Update regulatory rules for France (FR) on 6 and 60 GHz
  ea83a82 wireless-regdb: add support for US S1G channels
  4408149 wireless-regdb: add 802.11ah bands to world regulatory domain
  5f3cadc wireless-regdb: Update regulatory rules for Spain (ES) on 6GHz
  e0ac69b Revert "wireless-regdb: Update regulatory rules for South Korea (KR)"
  40e5e80 wireless-regdb: Update regulatory rules for South Korea (KR)
  e427ff2 wireless-regdb: Update regulatory rules for China (CN)
  0970116 wireless-regdb: Update regulatory rules for the Netherlands (NL) on 6GHz
  4dac44b wireless-regdb: update regulatory database based on preceding changes

[1] https://lore.kernel.org/linux-wireless/YhBCKWNw3IMfGs0L@ubuntu-x1/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 324f0552526d169c24cd75e9dadf67641f2beef0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index abe8f6b000..91fcb320d2 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446  wireless-regdb-2021.08.28.tar.xz
+sha256  8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f  wireless-regdb-2022.02.18.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9e01283c01..35a8c6686d 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2021.08.28
+WIRELESS_REGDB_VERSION = 2022.02.18
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
