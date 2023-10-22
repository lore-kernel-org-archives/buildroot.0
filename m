Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41770C001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 12:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD3945790;
	Sun, 22 Oct 2023 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD3945790
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Khn6B_0MWqVi; Sun, 22 Oct 2023 12:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AC7044B8D;
	Sun, 22 Oct 2023 12:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC7044B8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E699A1BF29D
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 12:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C05A770A45
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 12:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05A770A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oatXu54JXfwL for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 12:06:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1178A611C9
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 12:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1178A611C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDC0885D68; Sun, 22 Oct 2023 12:06:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 14:05:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f685549b19d4a728f824923e50c828d8b1f1e94e
X-Git-Newrev: 2c2d01ac0ffc3d5c61a962dfe85b7f865b362903
X-Patchwork-Hint: ignore
Message-Id: <20231022120620.EDC0885D68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: bump version to 1.60.01
 (code/advanced@r3176)
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
Content-Type: multipart/mixed; boundary="===============9179490898515332474=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9179490898515332474==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c2d01ac0ffc3d5c61a962dfe85b7f865b362903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
[yann.morin.1998@free.fr: bump to 01.60.01 bug fix with openssl]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 665ee31836..d50ac867a9 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br3.tar.gz
+sha256  f22f96a6dc1a574a843b5e383446fe1fa1022f211ee7c3f4c5fd8de1d5104393  libxmlrpc-r3176-br3.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index c1b0eae8ee..dd09fa8f53 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# 1.58.02 (code/advanced@r3119)
-LIBXMLRPC_VERSION = r3119
+# 1.60.01 (code/advanced@r3176)
+LIBXMLRPC_VERSION = r3176
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)

--===============9179490898515332474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9179490898515332474==--
