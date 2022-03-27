Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CBAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E40408D8;
	Sun, 27 Mar 2022 16:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gc-4KjJJx5sM; Sun, 27 Mar 2022 16:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DF2408D1;
	Sun, 27 Mar 2022 16:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63E9D1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABF360E2B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLXAoQ2osuCm for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CF0560E6F
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ED7E985E90; Sun, 27 Mar 2022 16:23:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b66fdc55fa097d139590d979f24c15b694e8bc3
X-Git-Newrev: b04d8ad4d2acfcea21f83b74f94feace6aa2ef04
X-Patchwork-Hint: ignore
Message-Id: <20220327162300.ED7E985E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-basexx: bump to version 0.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b04d8ad4d2acfcea21f83b74f94feace6aa2ef04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-basexx/lua-basexx.hash | 4 ++--
 package/lua-basexx/lua-basexx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
index aee636c32f..447ec60ba0 100644
--- a/package/lua-basexx/lua-basexx.hash
+++ b/package/lua-basexx/lua-basexx.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
-sha256 a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.0/LICENSE
+sha256  3f6a7134a518676d73a9ba80437487de9a7d482e54859a96c0c5d8b381b0a8c6  basexx-0.4.1-1.src.rock
+sha256  a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.1/LICENSE
diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
index 5aa5ecf218..22b5a3771e 100644
--- a/package/lua-basexx/lua-basexx.mk
+++ b/package/lua-basexx/lua-basexx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_BASEXX_VERSION = 0.4.0-1
+LUA_BASEXX_VERSION = 0.4.1-1
 LUA_BASEXX_NAME_UPSTREAM = basexx
 LUA_BASEXX_LICENSE = MIT
 LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
