Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADF3C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 21:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E4658212C;
	Mon, 30 Oct 2023 21:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E4658212C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnP_Byn-TDpk; Mon, 30 Oct 2023 21:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E62A082051;
	Mon, 30 Oct 2023 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62A082051
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69E491BF34E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 21:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5091141809
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5091141809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8NsLOGd0xKf for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87E4E417EC
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E4E417EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7822486219; Mon, 30 Oct 2023 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 22:56:42 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0dcf6edd9b7c3c19cd812103942d53e763ac47f8
X-Git-Newrev: f5f5ae024472e9862236ab062d126f071d16fed6
X-Patchwork-Hint: ignore
Message-Id: <20231030215809.7822486219@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cjson: bump to
 version 1.7.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5f5ae024472e9862236ab062d126f071d16fed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 654f18c61709cf8c7d92236c1b81bb80a9ce70d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index c39e884cdd..74844d6aa6 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5308fd4bd90cef7aa060558514de6a1a4a0819974a26e6ed13973c5f624c24b2  cjson-1.7.15.tar.gz
+sha256  451131a92c55efc5457276807fc0c4c2c2707c9ee96ef90c47d68852d5384c6c  cjson-1.7.16.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ad9d76a4ba..7ed732ac90 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.15
+CJSON_VERSION = 1.7.16
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
