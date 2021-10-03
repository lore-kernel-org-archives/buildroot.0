Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73A861B3E
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D73A861B3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB3D540536;
	Sun,  3 Oct 2021 08:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZoEE4-FhE1c; Sun,  3 Oct 2021 08:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A29D24019B;
	Sun,  3 Oct 2021 08:24:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81E2B1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C60360AD7
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3oztA6DY5xv for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E387E60AD8
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6E74F8DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc0583bd34d330fcc2bbef2c8a1f0da7a3da4b1a
X-Git-Newrev: cc031a0389322327cd7ab0b191d69ff846701b57
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.6E74F8DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc031a0389322327cd7ab0b191d69ff846701b57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Indent with two spaces in the hash file.
* License change was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-websockets/python-websockets.hash | 6 +++---
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index ec387c9ab7..cec1d1599c 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	a37f0e22c3aa5f1cf12a6a3ae22b36ca  websockets-8.0.2.tar.gz
-sha256	882a7266fa867a2ebb2c0baaa0f9159cabf131cf18c1b4270d79ad42f9208dc5  websockets-8.0.2.tar.gz
+md5  ebb9e4930bf2c35cd3723be0dfa83d89  websockets-10.0.tar.gz
+sha256  c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002  websockets-10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	8a88960c0d6aa8b38faa6ee614597dbf18e0ea22ba20884ef3dd31d34b2a6d09  LICENSE
+sha256  daeca11bf3608da35e546ea0c32be18958a8be1441fa3de9cbd20e4c8bc718e6  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 013881f95a..9f4c5f1da7 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 8.0.2
+PYTHON_WEBSOCKETS_VERSION = 10.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/79/78/17e97a159dc55308b1468a638c7267f19765281f6205ec9c15253c154022
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/1c/f4/61aee1eb4baadf8477fb7f3bc6b04a50fe683ef8ad2f60282806821e4b3b
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
