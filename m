Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3B1C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC5B610C2;
	Tue, 21 Feb 2023 01:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DC5B610C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVvzQfOWMASo; Tue, 21 Feb 2023 01:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8A76FB59;
	Tue, 21 Feb 2023 01:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E8A76FB59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48A5E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 678316FBD2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 678316FBD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBXTtwd0pUr4 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46DC6610A6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DC6610A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 353A181979; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:57:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 22e926e9af915303180d35b5c41ea5fbf411d753
X-Git-Newrev: 5c6f32bd255fc97823d464beacfa905a141066ec
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.353A181979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/janet: bump to version
 1.26.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c6f32bd255fc97823d464beacfa905a141066ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff LICENCE:
-Copyright (c) 2021 Calvin Rose and contributors
+Copyright (c) 2023 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janet/janet.hash | 4 ++--
 package/janet/janet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 5cd3db1c29..47e0de4a0f 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5bf9b680adbc5511835aec3787117df37032eef796e1664edbbcfd540b6acaf3  janet-1.25.0.tar.gz
+sha256  c95dab93e8e4ebcab5c293d5ee448fb43ab8bd2f6391fd66a6ca92fe1ec72c03  janet-1.26.0.tar.gz
 
 # Locally calculated
-sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
+sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 284e6c2642..db1eb2a5c4 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.25.0
+JANET_VERSION = 1.26.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
