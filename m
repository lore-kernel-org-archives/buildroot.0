Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90324C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5FB4F576;
	Tue, 21 Feb 2023 00:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D5FB4F576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcgeUNvw4sFN; Tue, 21 Feb 2023 00:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801AE4F57D;
	Tue, 21 Feb 2023 00:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801AE4F57D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21A561BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F1E6FB78
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F1E6FB78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkeHY2Pn6VV8 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EDBB6FB58
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDBB6FB58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C5F68648F; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:00:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dde078790a965dfd469ec6ed745e4f7b5edc60ba
X-Git-Newrev: 59461ec52ef6d70d08d0e68cd24a6a3db2dbb7fc
X-Patchwork-Hint: ignore
Message-Id: <20230220205233.4C5F68648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{python-}protobuf:
 bump to version 21.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=59461ec52ef6d70d08d0e68cd24a6a3db2dbb7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index f1f5fa77cd..b092c9303f 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  96f0ab99b7414e44e7bf9b218bb59510d61549ca68e648f19e3622f9999bec00  protobuf-cpp-3.21.11.tar.gz
+sha256  4eab9b524aa5913c6fffb20b2a8abf5ef7f95a80bc0701f3a6dbb4c607f73460  protobuf-cpp-3.21.12.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 33a7c40f40..8cd4e99e06 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.11
+PROTOBUF_VERSION = 21.12
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index c2afc3955a..e7af678b97 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae4ca6e1da635f31019d8911923163f372d9d333e8857510f513acba33172d0c  protobuf-python-4.21.11.tar.gz
+sha256  e2b976e67d6fcf7078f799143a73f2a4d9cf3126ca68a1a6f1bda30fe5f3585c  protobuf-python-4.21.12.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
