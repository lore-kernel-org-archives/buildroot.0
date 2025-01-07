Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E96C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 827FC4FFB4;
	Fri, 28 Feb 2025 16:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pmbc2C0MSdf; Fri, 28 Feb 2025 16:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E7B4F0BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E7B4F0BC;
	Fri, 28 Feb 2025 16:51:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B0C711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F4A42A0F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBt4qeA7GcVS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 200EA42509
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 200EA42509
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17F0A84C4E; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Jan 2025 21:27:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94f676021d89c616bb8432e84026a86c0face259
X-Git-Newrev: d5f0794d155d2d0b982604a4103287e04bec0966
X-Patchwork-Hint: ignore
Message-Id: <20250228162959.17F0A84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/json-c: bump to
 version 0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5f0794d155d2d0b982604a4103287e04bec0966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog - https://github.com/json-c/json-c/compare/json-c-0.17-20230812...json-c-0.18-20240915

Drop 0001-json_pointer.c-initialize-idx.patch.
Upstream commit - https://github.com/json-c/json-c/commit/7ff7eab603611c65b3110dcb1b0caf5cc68b07a3

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-json_pointer.c-initialize-idx.patch       | 37 ----------------------
 package/json-c/json-c.hash                         |  2 +-
 package/json-c/json-c.mk                           |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/json-c/0001-json_pointer.c-initialize-idx.patch b/package/json-c/0001-json_pointer.c-initialize-idx.patch
deleted file mode 100644
index 3dbe0b4067..0000000000
--- a/package/json-c/0001-json_pointer.c-initialize-idx.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7ff7eab603611c65b3110dcb1b0caf5cc68b07a3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 8 Nov 2023 22:42:48 +0100
-Subject: [PATCH] json_pointer.c: initialize idx
-
-Fix the following build failure with gcc 5:
-
-/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c: In function 'json_pointer_result_get_recursive':
-/home/thomas/autobuild/instance-2/output-1/build/json-c-0.17/json_pointer.c:193:25: error: 'idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-    res->index_in_parent = idx;
-                         ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/523b35a979d59121fe4e18c38171792b06233940/
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/json-c/json-c/pull/839
----
- json_pointer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_pointer.c b/json_pointer.c
-index 89e9e21..0ac8aaa 100644
---- a/json_pointer.c
-+++ b/json_pointer.c
-@@ -158,7 +158,7 @@ static int json_pointer_result_get_recursive(struct json_object *obj, char *path
-                                              struct json_pointer_get_result *res)
- {
- 	struct json_object *parent_obj = obj;
--	size_t idx;
-+	size_t idx = 0;
- 	char *endp;
- 	int rc;
- 
--- 
-2.42.0
-
diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index c9bb8c708b..88bb49cb9d 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6  json-c-0.17.tar.gz
+sha256  876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724  json-c-0.18.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 68401433b4..254b6fd838 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.17
+JSON_C_VERSION = 0.18
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
