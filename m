Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C22C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2855C40603;
	Mon, 18 Dec 2023 08:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2855C40603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKxBZEXlXOrA; Mon, 18 Dec 2023 08:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23DAE409C8;
	Mon, 18 Dec 2023 08:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23DAE409C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54ABB1BF94D
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E0B460D59
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0B460D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b60ufeLpXgmI for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB3060D7B
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB3060D7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B8BE87BBA; Mon, 18 Dec 2023 08:20:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:18:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4221e1068360ca4315593974d7bef79ec9f9c14e
X-Git-Newrev: a91ad89fe3e4a28ca5ae2ce6e9bada243aa55456
X-Patchwork-Hint: ignore
Message-Id: <20231218082041.1B8BE87BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: bump version to 3.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a91ad89fe3e4a28ca5ae2ce6e9bada243aa55456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index a6ba6b22c6..6ad363f01d 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.1.tar.xz.sig
-sha256  ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c  gnutls-3.8.1.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.2.tar.xz.sig
+sha256  e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77  gnutls-3.8.2.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d9b9831fd6..3e9987cdce 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
