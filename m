Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90BCA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED30160B86;
	Thu, 18 Sep 2025 20:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbmhiRNyysMS; Thu, 18 Sep 2025 20:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A1FB60B73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A1FB60B73;
	Thu, 18 Sep 2025 20:25:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07275273
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFDFC40BF5
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9JBNw5flw23 for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF8F40BFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CF8F40BFC
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DC4485D17; Thu, 18 Sep 2025 20:25:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 22:14:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d076a1b7660d696d2b2f4eb7b25d8d9bc555ddc
X-Git-Newrev: c878e088391a180429bb374020db36d097df9070
X-Patchwork-Hint: ignore
Message-Id: <20250918202508.0DC4485D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdm: bump to 1.1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=c878e088391a180429bb374020db36d097df9070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for Changes:
https://lists.x.org/archives/xorg/2025-March/061902.html

Fixes a compile error with gcc 14.x.

COPYRIGHT was updated:
-Copyright (c) 2002, 2006, 2009, 2010, Oracle and/or its affiliates.
-All rights reserved.
+Copyright (c) 2002, 2006, 2009, 2010, 2025, Oracle and/or its affiliates.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: fix COPYING license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash | 8 ++++----
 package/x11r7/xapp_xdm/xapp_xdm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index daf1b0852f..096fcf37f0 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003265.html
-sha256  3e9bf25636797ec9e595286dd6820ecc33901439f07705eaf608ecda012c3d5f  xdm-1.1.14.tar.xz
-sha512  8ed1d2c946916c24cb4b2de9326f65629c97e53b145312c9cb9c6e4308d8b47d67d3981319fbd4feac9b3ed436b9dfb24a1c905d37d7bcf07b49c18a68c7a6e4  xdm-1.1.14.tar.xz
+# From https://lists.x.org/archives/xorg/2025-March/061902.html
+sha256  9494aef0911a031c53670725b5c8c9bb9d3f7c5ea7318b1f72ddd9dcbbeceb6a  xdm-1.1.17.tar.xz
+sha512  68499cdf73c9b6b48b974a724e5d045bb8333cfd17f1d7e36132e7aec51922c22260b361517c4f0d9fb7d28ce4909e0638e00180e93544bc7200d9bef55e822b  xdm-1.1.17.tar.xz
 # Locally computed
-sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
+sha256  74cda705693518c793f05074a79bfc6876f97c8ce560856e2ba36e2d9bf0ab5a  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 2a343b55e2..03b9ad58e9 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.14
+XAPP_XDM_VERSION = 1.1.17
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
 XAPP_XDM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
