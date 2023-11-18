Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B182C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A2441690;
	Mon,  4 Dec 2023 20:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A2441690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W66J9kWSPMGJ; Mon,  4 Dec 2023 20:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39734416A9;
	Mon,  4 Dec 2023 20:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39734416A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 672A31BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DD7A4173B
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD7A4173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lb6ZJwUsVuAp for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CEBE416A9
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEBE416A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 662BF879B6; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:16:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbcb9554d561856abefbad5a339b40dd643eb25b
X-Git-Newrev: 44f138f44087a172c87865563ca6e3392f9e23df
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.662BF879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: bump to 2023-11-14
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=44f138f44087a172c87865563ca6e3392f9e23df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It supports up to Linux 6.7.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index e94a7b40ef..f2829d3f04 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  672787c3f3d1f795b750cd74de8ca34bb661b8ae60f5aa50fb279ec08ff3f05f  rtl8723ds-ec85dc6b9f72bfe413bff464ed01a272e29c8dbe.tar.gz
+sha256  4f3006ffc1604854edbd6d25ad468ca57f6bcfd7814e4dab57725f144f00aa94  rtl8723ds-52e593e8c889b68ba58bd51cbdbcad7fe71362e4.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index f62ce2bf6c..2536450d80 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = ec85dc6b9f72bfe413bff464ed01a272e29c8dbe
+RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
