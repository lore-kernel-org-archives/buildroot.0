Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62177C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1124F60F03;
	Wed, 28 May 2025 20:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNyWG8MmAZBy; Wed, 28 May 2025 20:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309FE60EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309FE60EFE;
	Wed, 28 May 2025 20:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8285EB91
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A3C40210
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UHzCD_l61v5 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF6540201
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF6540201
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88DD3877A0; Wed, 28 May 2025 20:25:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 22:24:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f6746c6334eec89025a8ed36377ed3477293882c
X-Git-Newrev: b89c274f51c6813a11a2aef499b66dcca8a1c550
X-Patchwork-Hint: ignore
Message-Id: <20250528202537.88DD3877A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iproute2: bump to
 version 6.15.0
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
Content-Type: multipart/mixed; boundary="===============5920457286454197571=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5920457286454197571==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b89c274f51c6813a11a2aef499b66dcca8a1c550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release announcement:
https://lore.kernel.org/netdev/20250526140140.38ba5578@hermes.local/

Changelog:
https://github.com/iproute2/iproute2/compare/v6.14.0...v6.15.0

Drop 0001-nstat-NULL-Dereference-when-no-entries-specified.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ULL-Dereference-when-no-entries-specified.patch | 36 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch b/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
deleted file mode 100644
index 9b5e727fe3..0000000000
--- a/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30 Mon Sep 17 00:00:00 2001
-From: ZiAo Li <23110240084@m.fudan.edu.cn>
-Date: Wed, 9 Apr 2025 23:03:30 +0800
-Subject: [PATCH] nstat: NULL Dereference when no entries specified
-
-The NULL Pointer Dereference vulnerability happens in load_ugly_table(), misc/nstat.c, in the latest version of iproute2.
-The vulnerability can be triggered by:
-1. db is set to NULL at struct nstat_ent *db = NULL;
-2. n is set to NULL at n = db;
-3. NULL dereference of variable n happens at sscanf(p+1, "%llu", &n->val) != 1
-
-Signed-off-by: ZiAo Li <23110240084@m.fudan.edu.cn>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30
----
- misc/nstat.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/misc/nstat.c b/misc/nstat.c
-index fce3e9c1..b2e19bde 100644
---- a/misc/nstat.c
-+++ b/misc/nstat.c
-@@ -218,6 +218,10 @@ static void load_ugly_table(FILE *fp)
- 			p = next;
- 		}
- 		n = db;
-+		if (n == NULL) {
-+			fprintf(stderr, "Error: Invalid input – line has ':' but no entries. Add values after ':'.\n");
-+			exit(-2);
-+		}
- 		nread = getline(&buf, &buflen, fp);
- 		if (nread == -1) {
- 			fprintf(stderr, "%s:%d: error parsing history file\n",
--- 
-2.49.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d64ff918c6..69de2917cf 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f  iproute2-6.14.0.tar.xz
+sha256  8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb  iproute2-6.15.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3faa2235b8..e3076a59a8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.14.0
+IPROUTE2_VERSION = 6.15.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \

--===============5920457286454197571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5920457286454197571==--
