Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD0860B95;
	Tue, 14 Jun 2022 15:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6x8BoDGgSZT; Tue, 14 Jun 2022 15:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B326360B19;
	Tue, 14 Jun 2022 15:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9B2B1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A877A82FF9
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2aKepSJymwz for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:57:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB03782F9E
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:57:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC76187001; Tue, 14 Jun 2022 15:45:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:53:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df13e24c9f8a3929d9b91f5160976d1b09dc805a
X-Git-Newrev: 9ff3cd1cc13b7f779b3c87ceb377c2beed8e277a
X-Patchwork-Hint: ignore
Message-Id: <20220614154515.DC76187001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: bump to version 3.7.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ff3cd1cc13b7f779b3c87ceb377c2beed8e277a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index c09e4665e5..ff191278ca 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
-sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
+sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff  gnutls-3.7.6.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ac83bb35d3..cd2c6b45bf 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
