Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A73CD5BDD
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 11:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DAF81ED8;
	Fri,  6 Sep 2024 11:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE-su0YAXMrM; Fri,  6 Sep 2024 11:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A47840FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A47840FA;
	Fri,  6 Sep 2024 11:58:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D095F1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD89A40FDE
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6furZmNHnSit for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C49D40FA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C49D40FA9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8765386E8F; Fri,  6 Sep 2024 11:58:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:55:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 207430d368afd5ff1169d5191ab161a56d052fb3
X-Git-Newrev: 046f174ddf150cced4c9d7bcb3d2b5fc38bdd227
X-Patchwork-Hint: ignore
Message-Id: <20240906115852.8765386E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/iperf3: bump to
 version 3.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=046f174ddf150cced4c9d7bcb3d2b5fc38bdd227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes - https://github.com/esnet/iperf/releases/tag/3.16

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f94b3b35423a3d7b93e7fdd67e97dea6e33de60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 02ada0dcc6..a8634c4a7e 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.14.tar.gz.sha256
-sha256  723fcc430a027bc6952628fa2a3ac77584a1d0bd328275e573fc9b206c155004  iperf-3.14.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.16.tar.gz.sha256
+sha256  cc740c6bbea104398cc3e466befc515a25896ec85e44a662d5f4a767b9cf713e  iperf-3.16.tar.gz
 # Locally computed
 sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index c00b16ce61..6d902c3b13 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.14
+IPERF3_VERSION = 3.16
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
