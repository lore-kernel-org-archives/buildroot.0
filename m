Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E0CFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBD360644;
	Sun, 30 Oct 2022 11:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBD360644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FQDJtlL0tTM; Sun, 30 Oct 2022 11:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7883660A72;
	Sun, 30 Oct 2022 11:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7883660A72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7011BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F02812FD
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F02812FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-nKOT75qkkA for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537BC812E2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537BC812E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C8C087471; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:53:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a92f29dae72fca79a3585abe93c2482528bbfe83
X-Git-Newrev: 3be3113b570715121d5b8f9ea689cf42ed512d66
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.3C8C087471@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minissdpd: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3be3113b570715121d5b8f9ea689cf42ed512d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (license refined for github:
https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)

http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.6.0.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index e14fe7ab2c..bc1db5f283 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a073be9c6d9194feaeccf31cd986c48afd2212426b6594e75166cedff1c461aa  minissdpd-1.5.20211105.tar.gz
-sha256  45950e1d443106906f83a4ec7b9c2e1a9d6457130737a493cff0e5b7a39da570  LICENSE
+sha256  f4c2dea6a472e0a5cc9dca2dc4c1fc36ba5538eacf8d793825293251725546bd  minissdpd-1.6.0.tar.gz
+sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 2b9fac4df1..4f594cb5a0 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20211105
+MINISSDPD_VERSION = 1.6.0
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
