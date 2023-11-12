Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AC6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 14:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 916124061C;
	Sun, 12 Nov 2023 14:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 916124061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvL8buIJ6LNy; Sun, 12 Nov 2023 14:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D632841563;
	Sun, 12 Nov 2023 14:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D632841563
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98B3F1BF476
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62D124169E
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D124169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id safcKDkX0-rW for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54D3341523
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D3341523
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2832787077; Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 15:08:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01932fec171d2d548d20e64e0236e8f6161d689b
X-Git-Newrev: ed0be8ab1d4af5af04b204a00fc4e62d5c36aaa9
X-Patchwork-Hint: ignore
Message-Id: <20231112140939.2832787077@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: bump to 3.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed0be8ab1d4af5af04b204a00fc4e62d5c36aaa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.3.news
 - https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.news

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoup3/libsoup3.hash | 4 ++--
 package/libsoup3/libsoup3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
index 01313b394b..11e48b42aa 100644
--- a/package/libsoup3/libsoup3.hash
+++ b/package/libsoup3/libsoup3.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.2.sha256sum
-sha256  78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3  libsoup-3.4.2.tar.xz
+# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.sha256sum
+sha256  291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa  libsoup-3.4.4.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 9e66b6ebd2..76105cec4e 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP3_VERSION_MAJOR = 3.4
-LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).2
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).4
 LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
 LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
 LIBSOUP3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
