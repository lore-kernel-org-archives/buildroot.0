Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31123408F1;
	Tue, 14 Dec 2021 20:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd1ZAKf_py_8; Tue, 14 Dec 2021 20:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73CE9409DA;
	Tue, 14 Dec 2021 20:11:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18E2E1BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B81948133C
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzPL4SL9Stsk for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19910813F4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 15C1F8182C; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 303f3e95d31440b401f95ca469ca8b110936f2be
X-Git-Newrev: 5e5bf056233b3046112396be8a33bc59fb2f62d9
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.15C1F8182C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump version to 2.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e5bf056233b3046112396be8a33bc59fb2f62d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog ([1]):

  - fix tos (-S) regression
  - fix --permit-key regression

[1] https://sourceforge.net/projects/iperf2/files/readme.txt/download

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iperf/iperf.hash | 4 ++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 924d10b3e0..2e1f433dc7 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
+sha1  41bd049625cbecda2bf5b6a6cc12a6c5baec549b  iperf-2.1.6.tar.gz
 
 # Locally computed:
-sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
+sha256  4a43e44439b95622aebeee55754a17d1c94076032e90620dfc1ab9908cb9e080  iperf-2.1.6.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index a3d95535b3..f999ff4ac2 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.5
+IPERF_VERSION = 2.1.6
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
