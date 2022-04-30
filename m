Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2817DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63CF81DA3;
	Sat, 30 Apr 2022 15:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P56UAmi_BycM; Sat, 30 Apr 2022 15:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBE481D3D;
	Sat, 30 Apr 2022 15:52:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEFE51BF94B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD38E60A83
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQxC47Qh4SGY for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2130060784
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:52:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EB6EE84777; Sat, 30 Apr 2022 15:41:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 17:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdee03647f9ada725d739e3980d092c6f12d9d3b
X-Git-Newrev: 660b2379db1eec500191102dc94beda39ff0ebbe
X-Patchwork-Hint: ignore
Message-Id: <20220430154148.EB6EE84777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmnl: bump to version 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=660b2379db1eec500191102dc94beda39ff0ebbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add sha256 hash and update hash file formatting.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmnl/libmnl.hash | 11 ++++++-----
 package/libmnl/libmnl.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index e5bb2fa603..4b592333cb 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,6 +1,7 @@
-# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2.{md5sum,sha1sum}
-md5	be9b4b5328c6da1bda565ac5dffadb2d	libmnl-1.0.4.tar.bz2
-sha1	2db40dea612e88c62fd321906be40ab5f8f1685a	libmnl-1.0.4.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
+md5  0bbb70573119ec5d49435114583e7a49  libmnl-1.0.5.tar.bz2
+sha1  63c6456b77f7978a7b37e62c1b38346b2ef2d91c  libmnl-1.0.5.tar.bz2
 
-# Hash for license file:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+# Locally calculated
+sha256  274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525  libmnl-1.0.5.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index d3b33db2e0..3361d05248 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMNL_VERSION = 1.0.4
+LIBMNL_VERSION = 1.0.5
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
