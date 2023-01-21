Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28147C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C99611B9;
	Tue, 21 Feb 2023 01:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2C99611B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjcaOvdVHcAA; Tue, 21 Feb 2023 01:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00641612BA;
	Tue, 21 Feb 2023 01:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00641612BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3D1E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DC16FBAC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8DC16FBAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucS-rxls80wC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F06446FBA1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06446FBA1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE956828C8; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:55:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2d7de5b2befe5a1703fbd583514aa46b457246d4
X-Git-Newrev: 9086723227c535010986d831954ec932d3e783fb
X-Patchwork-Hint: ignore
Message-Id: <20230220205237.EE956828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gssdp: switch to https
 download
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

commit: https://git.buildroot.net/buildroot/commit/?id=9086723227c535010986d831954ec932d3e783fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gssdp/gssdp.hash | 2 +-
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index c9bbd66083..34ccfa8044 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
+# Hash from: https://download.gnome.org/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
 sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
 
 # Hash for license file:
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index f1fed3713d..f7ebb44acd 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -7,7 +7,7 @@
 GSSDP_VERSION_MAJOR = 1.4
 GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
-GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
+GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
