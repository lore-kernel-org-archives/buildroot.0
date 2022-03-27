Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C91C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B1660C33;
	Sun, 27 Mar 2022 16:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DqjEqmyYjZha; Sun, 27 Mar 2022 16:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2940060C15;
	Sun, 27 Mar 2022 16:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0F81BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7376860AD0
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-Qe0Zw_BmSd for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D5E60EE6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:32:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 05AA185E90; Sun, 27 Mar 2022 16:23:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 18:12:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b04d8ad4d2acfcea21f83b74f94feace6aa2ef04
X-Git-Newrev: 6b609e77bfab37ee71d31eeff24640a302946a44
X-Patchwork-Hint: ignore
Message-Id: <20220327162301.05AA185E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasec: bump to version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b609e77bfab37ee71d31eeff24640a302946a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-LuaSec 1.0 license
+LuaSec 1.0.2 license

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1ea422aa9b..1e381612bd 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b7e18f475c64896fe4921d367adabae765914f7526a68487a5fa6831040e7138  luasec-1.0-1.src.rock
-sha256  0d3431dad143f41c8902e4ee867e386a702ebad856c45239fb86460e27dabfbf  luasec/LICENSE
+sha256  7ed5d08aad8f0e8659abb3f43c935da1c898474d4dc121e9edfbeae5c4c67fb0  luasec-1.0.2-1.src.rock
+sha256  84376baf33cefbcc1e9adbca23fcf87f51c1107956660cda2880feaef86d6075  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 3ef0c14daf..4ace94d168 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.0-1
+LUASEC_VERSION = 1.0.2-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
