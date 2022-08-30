Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490FECAAD5
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5627826DA;
	Tue, 30 Aug 2022 19:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5627826DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIJwEEAhnj4r; Tue, 30 Aug 2022 19:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9AAA823E3;
	Tue, 30 Aug 2022 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AAA823E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B63741BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EA8160FB4
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA8160FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXPknexuJsTg for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A627A60E78
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A627A60E78
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9DA7B88131; Tue, 30 Aug 2022 18:52:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 21:06:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5894ab010771d8ee638ee2f7d84284200cdbbac3
X-Git-Newrev: 81dd6f1b73ae2359ea8aeda66d0a993393673e33
X-Patchwork-Hint: ignore
Message-Id: <20220830185206.9DA7B88131@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 21.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=81dd6f1b73ae2359ea8aeda66d0a993393673e33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes:
- Fixed comparison of maps in Python.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 9dc0f9ff07..8e5ba09c9d 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  a9fd8043fef746e8d8cca9f023fb7ba6d3d102eab6dd35a04ce7157d1928726b  protobuf-cpp-3.21.4.tar.gz
+sha256  58c8a18b4ec22655535c493155c5465a8903e8249094ceead87e00763bdbc44f  protobuf-cpp-3.21.5.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ffbc39347f..199e423d71 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.4
+PROTOBUF_VERSION = 21.5
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index ae2e07d637..1b106445a5 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32d8a37271f42aaa0f40659f77040484d6048b187e4a98dac09eb9ed592a91dc  protobuf-python-4.21.4.tar.gz
+sha256  4b384ad2bc6832ede8703b4567c47498bccf104cb79fd20d2d2e3069066ae245  protobuf-python-4.21.5.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
