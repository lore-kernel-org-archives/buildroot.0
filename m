Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302B3C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E599760F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E599760F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB9DC4023B;
	Sun, 25 Jul 2021 13:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRtgJr351wWD; Sun, 25 Jul 2021 13:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FCD4400E5;
	Sun, 25 Jul 2021 13:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF1B1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB5F4038D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSggrENk105X for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A2F403A4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7EDE484096; Sun, 25 Jul 2021 12:34:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:03:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ebbbe38ce9bdcea5b97a1c3c447ae92728fa706
X-Git-Newrev: 0e98778951db2e293dc10d16074b8fce949827a1
X-Patchwork-Hint: ignore
Message-Id: <20210725123431.7EDE484096@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-silva: bump to version 0.1.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0e98778951db2e293dc10d16074b8fce949827a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 3181ca12c2..bcd0d3071d 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 8211adfc46629524fc2ba629b616ba84790ca7676ef1ebed20e8de9016c24c10  lua-silva-0.1.7-1.src.rock
-sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.7/COPYRIGHT
+sha256 0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
+sha256 5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 8b92586baf..91b1b77476 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.1.7-1
+LUA_SILVA_VERSION = 0.1.8-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
