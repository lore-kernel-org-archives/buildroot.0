Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADBFD4049A;
	Sun, 20 Feb 2022 15:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAqRqP3_e2t6; Sun, 20 Feb 2022 15:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE52B40190;
	Sun, 20 Feb 2022 15:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1DA1BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B8FE4058C
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY6AyseX1UEr for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 15:37:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975F94054E
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 15:37:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5A26182A79; Sun, 20 Feb 2022 15:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 16:36:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c4d28922942deb0fc41d11d4057b7fedd25cab1
X-Git-Newrev: 324f0552526d169c24cd75e9dadf67641f2beef0
X-Patchwork-Hint: ignore
Message-Id: <20220220152923.5A26182A79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless-regdb: bump version to
 2022.02.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=324f0552526d169c24cd75e9dadf67641f2beef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
