Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C401BC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:45:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8924860FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8924860FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8B440302;
	Tue, 20 Jul 2021 20:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq3F1I-7wOQT; Tue, 20 Jul 2021 20:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6628440308;
	Tue, 20 Jul 2021 20:45:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E06431BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCAE96063F
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6zWC04VIX4x for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31BBE605CB
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EC45288638; Tue, 20 Jul 2021 20:11:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:41:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0a7e2bf9c8a7897e13eaaf6584b29a65c13df1c
X-Git-Newrev: 4cf1efb04add60e5dcb3eb4edd9156a84d3e11ec
X-Patchwork-Hint: ignore
Message-ID: <20210720201140.EC45288638@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-livr: bump to version 0.2.2
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
Message-ID: <20210720204127.MBSY0A661VylltpfTnWcOYG32o8v025QenNJ519-CbI@z>

commit: https://git.buildroot.net/buildroot/commit/?id=4cf1efb04add60e5dcb3eb4edd9156a84d3e11ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
- Copyright (C) 2018-2019 Francois Perrad.
+ Copyright (C) 2018-2021 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index a891420b49..73b0fefa71 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 a3890301ed5f393b585cab26ac944eddc9df41bfa2ab87c11785925193453493  lua-livr-0.2.1-1.src.rock
-sha256 8f09089acf52cfabcc2a44ec3a492dc261e0ae9df3c618f43b33805e696e02d8  lua-LIVR-0.2.1/COPYRIGHT
+sha256 e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
+sha256 69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 25034b897b..3f114c725e 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.2.1-1
+LUA_LIVR_VERSION = 0.2.2-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
