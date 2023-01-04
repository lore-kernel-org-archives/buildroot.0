Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60612C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F069C4049F;
	Wed,  4 Jan 2023 21:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F069C4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QIxqtQRGnaO; Wed,  4 Jan 2023 21:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4CA40343;
	Wed,  4 Jan 2023 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4CA40343
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66F671BF279
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC652610D5
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 21:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC652610D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRl9YcKxlPb5 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25A0560DFD
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A0560DFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1404E8756E; Wed,  4 Jan 2023 21:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:23:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bee8635d90f3f9e3d04e03a9db2f37a387e077c
X-Git-Newrev: 848450f32bd3b877a7529f72e23c1d967f717552
X-Patchwork-Hint: ignore
Message-Id: <20230104213637.1404E8756E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.96.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=848450f32bd3b877a7529f72e23c1d967f717552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 9649e24f7f..29cf443a24 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2753fc01452a3d2ee665e8365afdac0e9683197f3ec06231aa684a48b286d11c  lsof-4.96.3.tar.gz
+sha256  e9030af1123ff052ab69e12ef55b8a17dc47ac4bccfba85ee1ca1f31acf29607  lsof-4.96.5.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 8c8c46c4ed..fd5887141b 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.96.3
+LSOF_VERSION = 4.96.5
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
