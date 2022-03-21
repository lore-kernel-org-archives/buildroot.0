Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83591C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B2041521;
	Mon, 21 Mar 2022 16:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGsXfcy7ahra; Mon, 21 Mar 2022 16:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E45D408B4;
	Mon, 21 Mar 2022 16:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14FB41BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABE8940899
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WV-eMizmfHT for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:54:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3D33415B2
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:54:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F046D849D4; Mon, 21 Mar 2022 16:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:45:31 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f3b7654bcd800d2365815bd60390bad3b1aee830
X-Git-Newrev: 64f550116bdee300a68569361e6b2c89b8bc44fa
X-Patchwork-Hint: ignore
Message-Id: <20220321164603.F046D849D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/timescaledb: bump
 version to 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=64f550116bdee300a68569361e6b2c89b8bc44fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.4.0

Starting from 2.4.0 timescaledb runs TAP tests by default so disable it by
-DTAP_CHECKS=OFF.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0610d838d82a46141d762a498b09762e8f423c68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index e97045f7d5..4b6d6f77a8 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  730e61e48f471c1d643494421d21e43766128cbcb62a5c4b138c171379195cf2  timescaledb-2.3.0.tar.gz
+sha256  1adbff3ae7f8f39d1b5ac2189d60b9bd0a8154c0c3603e53b030a204f72d86af  timescaledb-2.4.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 27e9142b0c..900bac5a7e 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.3.0
+TIMESCALEDB_VERSION = 2.4.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
@@ -16,6 +16,7 @@ TIMESCALEDB_DEPENDENCIES = postgresql
 # pg_config replacement doesn't implement --cppflags --cflags
 # --ldflags and --libs.
 TIMESCALEDB_CONF_OPTS = \
+	-DTAP_CHECKS=OFF \
 	-DREGRESS_CHECKS=OFF \
 	-DWARNINGS_AS_ERRORS=OFF \
 	-DPG_PKGLIBDIR=lib/postgresql \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
