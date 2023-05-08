Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41220C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B193D40B5E;
	Mon,  8 May 2023 19:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B193D40B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16GWqaT-e1Oa; Mon,  8 May 2023 19:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFFBB41D31;
	Mon,  8 May 2023 19:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFFBB41D31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D441BF868
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A023D41D7E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A023D41D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrTJ7ah7L-Ra for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:18:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4D4415C9
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A4D4415C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D9E8615A; Mon,  8 May 2023 19:18:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:17:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3caf10cb0c384d189e800bc23b7d01b9c0c6a62c
X-Git-Newrev: 37fd4ee80a408d8fa810eb1926cac111acbba811
X-Patchwork-Hint: ignore
Message-Id: <20230508191839.72D9E8615A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=37fd4ee80a408d8fa810eb1926cac111acbba811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index cbeebc579d..1af699dbe3 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.1.0/dav1d-1.1.0.tar.xz.sha256
-sha256  fb57aae7875f28c30fb3dbae4a3683d27e2f91dde09ce5c60c22cef9bc58dfd1  dav1d-1.1.0.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.2.0/dav1d-1.2.0.tar.xz.sha256
+sha256  231bed8bc1bb28a41d88da6b4c2c118de84b92e5f1d67caffa1b7f81aaea8c6e  dav1d-1.2.0.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 5fe603fc1c..f8d4464cd4 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.1.0
+DAV1D_VERSION = 1.2.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
