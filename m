Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC83ACA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA1540BEE;
	Tue, 19 Aug 2025 15:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qIZbRZ7TCef; Tue, 19 Aug 2025 15:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE28140BE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE28140BE2;
	Tue, 19 Aug 2025 15:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4697EDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A6140BE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mqFj8XUVD1e for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7162340BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7162340BDE
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 692DB87756; Tue, 19 Aug 2025 15:04:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 17:02:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 88c970318df6712febfc9a7087860e2639e9d9e4
X-Git-Newrev: f1359db9c54bf815e142ea50821f5168da474500
X-Patchwork-Hint: ignore
Message-Id: <20250819150411.692DB87756@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-utf8: bump to
 version 0.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1359db9c54bf815e142ea50821f5168da474500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/starwing/luautf8/releases/tag/0.1.6

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index b4d455ceb7..8973b4bffb 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  68bd8e3c3e20f98fceb9e20d5a7a50168202c22eb45b87eff3247a0608f465ae  luautf8-0.1.5-2.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.5/LICENSE
+sha256  37901bc127c4afe9f611bba58af7b12eda6599fc270e1706e2f767807dfacd82  luautf8-0.1.6-1.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.6/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 33c34a4eb2..991ebfa2f9 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.5-2
+LUA_UTF8_VERSION = 0.1.6-1
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
