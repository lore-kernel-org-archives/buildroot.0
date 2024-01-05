Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC1FC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D649843727;
	Fri,  5 Jan 2024 12:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D649843727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3cwCfmprqHv; Fri,  5 Jan 2024 12:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C7543720;
	Fri,  5 Jan 2024 12:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C7543720
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0E011BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614FF614C1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614FF614C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQzIMfdJItiX for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2BC61499
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2BC61499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09C17844C8; Fri,  5 Jan 2024 12:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:49:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0628ca52f6325e40106315e7545c5181cc825f9c
X-Git-Newrev: 8c2cda500315e50ea28874b2d8970ae9c568baff
X-Patchwork-Hint: ignore
Message-Id: <20240105125238.09C17844C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/isl: bump to version 0.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c2cda500315e50ea28874b2d8970ae9c568baff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://groups.google.com/g/isl-announce/c/_yQ27dRgf7w

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 46d8e920f3..1f8c998235 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be7b210647ccadf90a2f0b000fca11a4d40546374a850db67adb32fad4b230d9  isl-0.25.tar.xz
+sha256  a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504  isl-0.26.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index ce9aaecebc..42830a2689 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.25
+ISL_VERSION = 0.26
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
