Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF5C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638B360A7D;
	Sat, 30 Dec 2023 17:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638B360A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lj3LWwkVRBGn; Sat, 30 Dec 2023 17:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A0F60AA0;
	Sat, 30 Dec 2023 17:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A0F60AA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3668F1BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FBA060A67
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBA060A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJSKIYt9bCjR for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA9A560797
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA9A560797
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5DFB838C4; Sat, 30 Dec 2023 17:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7938d2ae78ace5bffcf523f06304b27cd4edc0b
X-Git-Newrev: 2d61c7dba8d016d91b1fe1c33bcaae8b161de46f
X-Patchwork-Hint: ignore
Message-Id: <20231230175053.C5DFB838C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipcalc: bump to version 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d61c7dba8d016d91b1fe1c33bcaae8b161de46f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipcalc/ipcalc.hash | 2 +-
 package/ipcalc/ipcalc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index 50d08239fa..dec69d2abf 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47c866941916800270fca23496acc9976ca9488ce9053aeaedc5f47c5929b772  ipcalc-1.0.2.tar.bz2
+sha256  5ed8f20819a5bdb089829fc62c9a2c685252759d5c3ec289492e6ef5762f4e3b  ipcalc-1.0.3.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index e63e174ce2..c1eba5d59f 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.2
+IPCALC_VERSION = 1.0.3
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
