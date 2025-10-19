Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63538CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED0484039;
	Sun, 19 Oct 2025 19:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-mjiI8anbuL; Sun, 19 Oct 2025 19:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB6D68403D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB6D68403D;
	Sun, 19 Oct 2025 19:31:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 368CFD9E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AEAD84030
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZjG6nh8txzw for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B46068402D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B46068402D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3A7E828F7; Sun, 19 Oct 2025 19:31:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7037907da45091e663cb1b2cfbb51ca5016304b
X-Git-Newrev: 41fe787cde45ee498a8c34f2cd94a7ba47821a5d
X-Patchwork-Hint: ignore
Message-Id: <20251019193102.A3A7E828F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwloc: bump to version 2.12.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41fe787cde45ee498a8c34f2cd94a7ba47821a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 2.11.2, see:
https://github.com/open-mpi/hwloc/blob/hwloc-2.12.2/NEWS#L20

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwloc/hwloc.hash | 6 +++---
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index f85508b7a6..0e5da51112 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
-# From https://www.open-mpi.org/software/hwloc/v2.11/
-sha1  8c15d9707c2390bcdc564df11395a36c8fc775be  hwloc-2.11.2.tar.bz2
-sha256  f7f88fecae067100f1a1a915b658add0f4f71561259482910a69baea22fe8409  hwloc-2.11.2.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.12/
+sha1  be96a4b54da92fce34e5c7f68c719ab778e058fa  hwloc-2.12.2.tar.bz2
+sha256  563e61d70febb514138af0fac36b97621e01a4aacbca07b86e7bd95b85055ba0  hwloc-2.12.2.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 0d03757d83..fc999b3750 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.11
+HWLOC_VERSION_MAJOR = 2.12
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
