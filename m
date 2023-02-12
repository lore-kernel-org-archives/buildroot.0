Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A48C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EC0700FF;
	Tue, 21 Feb 2023 01:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EC0700FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgP4RHz9jpsd; Tue, 21 Feb 2023 01:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4195D700A6;
	Tue, 21 Feb 2023 01:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4195D700A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB971BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0499270022
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0499270022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl8RwgQaAyPO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A747000E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A747000E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 363CB828C8; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:48:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0c933adab99e1767bb673610b69de5eedf42c5a
X-Git-Newrev: 27f38e175346c09eed003e95daa0f065b43e27e4
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.363CB828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8723ds: bump to
 2023-02-11 version with new license file
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

commit: https://git.buildroot.net/buildroot/commit/?id=27f38e175346c09eed003e95daa0f065b43e27e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A COPYING file has been added to rtl8723ds as of the most recent commit.

Update the version of the package and add the license file hash.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rtl8723ds/rtl8723ds.hash | 3 ++-
 package/rtl8723ds/rtl8723ds.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index d5abf9913c..e94a7b40ef 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  97f3ebc5d977ba35d10c9c06e6817e4a00458727b651b56fc00c207c05a61995  rtl8723ds-a638cc8639015b8b9390af3350fab0366b6c87e7.tar.gz
+sha256  672787c3f3d1f795b750cd74de8ca34bb661b8ae60f5aa50fb279ec08ff3f05f  rtl8723ds-ec85dc6b9f72bfe413bff464ed01a272e29c8dbe.tar.gz
+sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index f303a24041..1bb164fa86 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
+RTL8723DS_VERSION = ec85dc6b9f72bfe413bff464ed01a272e29c8dbe
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
+RTL8723DS_LICENSE_FILES = COPYING
 
 RTL8723DS_USER_EXTRA_CLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
