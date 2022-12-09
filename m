Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65560C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089E680D8A;
	Fri,  9 Dec 2022 17:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 089E680D8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1FSIKm3Q9hc; Fri,  9 Dec 2022 17:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4158080C89;
	Fri,  9 Dec 2022 17:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4158080C89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EAA41BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF82341013
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF82341013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOWVKoTzdwbz for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFACC41032
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFACC41032
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFDA85EA1; Fri,  9 Dec 2022 17:01:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e17f3076021efbd9ed699d78dc252aa0bf629922
X-Git-Newrev: 5cd2f31a255b4295d83adaeb8db97150c3f660ac
X-Patchwork-Hint: ignore
Message-Id: <20221209170104.BDFDA85EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_fstobdf: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cd2f31a255b4295d83adaeb8db97150c3f660ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-October/003215.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_fstobdf/xapp_fstobdf.hash | 5 +++--
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
index a2f1425afb..956c3ef0e3 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002511.html
-sha256  66cf550326c993e7043f260a8ec4a533a3bf9d8f0e7397a6fe9cca803732e92e  fstobdf-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003215.html
+sha256  2624cbf071ccca89c2a6dadd65004784f478b2ba1c62b8209e03909954f36b50  fstobdf-1.0.7.tar.xz
+sha512  b303cc2060e8ccaa139e855a7d377d28877158efa1087eeeebf9f30f7c9962764eceab5c4044b4b508890413cf38546da9b26756dd27a142b806dcd6fdb6ba59  fstobdf-1.0.7.tar.xz
 # Locally computed
 sha256  b76125d919ac2bfbff96955dec98b90729633b2df5fbfa2ad3f2e4376164febb  COPYING
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index e897514c80..989883d42e 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FSTOBDF_VERSION = 1.0.6
-XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
-XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSTOBDF_VERSION = 1.0.7
+XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.xz
+XAPP_FSTOBDF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSTOBDF_LICENSE = MIT
 XAPP_FSTOBDF_LICENSE_FILES = COPYING
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
