Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB57FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B9B417CB;
	Thu,  9 Nov 2023 21:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9B417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3epXGh9-VUiV; Thu,  9 Nov 2023 21:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1C440354;
	Thu,  9 Nov 2023 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1C440354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67F211BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B991560F7E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B991560F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHDfjhXpwTaG for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC12F61499
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC12F61499
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBDF486E95; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 21:58:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8903773f7e81be279b9cf32f522a3763ba26529e
X-Git-Newrev: c616c640d2a56c7abed356abb5566b4b1b72b217
X-Patchwork-Hint: ignore
Message-Id: <20231109210542.DBDF486E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgfy: bump to version 0.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c616c640d2a56c7abed356abb5566b4b1b72b217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-msgfy/python-msgfy.hash | 4 ++--
 package/python-msgfy/python-msgfy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
index 9f5bfe4804..2517afbb48 100644
--- a/package/python-msgfy/python-msgfy.hash
+++ b/package/python-msgfy/python-msgfy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgfy/json
-md5  1727a08a0cf7fb704045168c71993280  msgfy-0.2.0.tar.gz
-sha256  37c907cccb19afe73ce44111a21b410b685be92c9c44496bc4381fd93c5ad7b6  msgfy-0.2.0.tar.gz
+md5  ef3c61804003f4356119f7d00c5932f9  msgfy-0.2.1.tar.gz
+sha256  161024732591444cc05ca3982a010005932005ec861467dead49349447a91671  msgfy-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index 4100a912b2..8565c2210e 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGFY_VERSION = 0.2.0
+PYTHON_MSGFY_VERSION = 0.2.1
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/c6/2a/663ef86625f34ee4165da1eb824442cfb1f676e892946d7fe39a8c775682
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/51/0e/b78151a63e8c5cab745e90ed7b4a741dba5439a8538636bf6a5da72bad23
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
