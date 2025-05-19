Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141CBC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE9660FDA;
	Mon, 19 May 2025 17:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhsICBhf9bwV; Mon, 19 May 2025 17:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2CE460FD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CE460FD2;
	Mon, 19 May 2025 17:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD2E193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 306AD411D2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiFTWMDUIaS2 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6201B411C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6201B411C2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:11:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59F578741D; Mon, 19 May 2025 17:11:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 19:09:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ef0bfa759bf7b9cf8d9b5097200665054b1c864
X-Git-Newrev: 7f3329b7fd2bf1983c5c48dc514a16d67b2155a3
X-Patchwork-Hint: ignore
Message-Id: <20250519171131.59F578741D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gperf: bump to version
 3.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f3329b7fd2bf1983c5c48dc514a16d67b2155a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00013.html
https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00004.html

Changelog:
https://git.savannah.gnu.org/gitweb/?p=gperf.git;a=blob;f=ChangeLog;h=7966fcd0384f833f8b7d8ebdf9c5c90c22b4e48c;hb=d2aeec9b9c1fd04dbf747afe4ada8e772d315ccd

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gperf/gperf.hash | 4 ++--
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 1ea48c454b..9615c4e62b 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz.sig
+# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.3.tar.gz.sig
 # with key 93C08C88471097CD
-sha256  588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2  gperf-3.1.tar.gz
+sha256  fd87e0aba7e43ae054837afd6cd4db03a3f2693deb3619085e6ed9d8d9604ad8  gperf-3.3.tar.gz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 4b928a0ebd..cf0694f9f8 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.1
+GPERF_VERSION = 3.3
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
