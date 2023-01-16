Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A70C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471F66110F;
	Tue, 21 Feb 2023 00:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471F66110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yF4lEFLqJS5D; Tue, 21 Feb 2023 00:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFC360BD2;
	Tue, 21 Feb 2023 00:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFC360BD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2670C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B0C6FB8D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B0C6FB8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5C-_MvD9__rU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D97A610A0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D97A610A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A1608648F; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:23:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 04fc02a8b7a70bc0afe17fe0625cfd2b4c55b776
X-Git-Newrev: aac8ce4999c3c2e105347fd247ba65304ab0d26a
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.4A1608648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-cffi: bump to
 version 0.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=aac8ce4999c3c2e105347fd247ba65304ab0d26a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-cffi/lua-cffi.hash | 2 +-
 package/lua-cffi/lua-cffi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
index e710199936..318f60fefe 100644
--- a/package/lua-cffi/lua-cffi.hash
+++ b/package/lua-cffi/lua-cffi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  34fb4eea7a0abec2095f08596f604ac01c81b979bead7d2f5cb084b3e2b46cbc  lua-cffi-0.2.2.tar.gz
+sha256  1d2577a62a843e5e6db35af1b58300d279b4df58eccef5e823441501f960d388  lua-cffi-0.2.3.tar.gz
 sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index ac351f7f98..30427ac34c 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION = 0.2.2
+LUA_CFFI_VERSION = 0.2.3
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
