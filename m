Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52771C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2AD4034F;
	Mon,  6 Nov 2023 13:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2AD4034F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ylfow5vdc8tP; Mon,  6 Nov 2023 13:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C324175F;
	Mon,  6 Nov 2023 13:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C324175F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5CF91BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA73C60AE7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA73C60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rd_WqMGNzfdV for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F352761181
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F352761181
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E196986911; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:41:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 509e05f7af9e69248b1e8f1f4efe1d553ef34ea2
X-Git-Newrev: d4b2fc9ae8a45cbfbb853706019aa19e467f3ae8
X-Patchwork-Hint: ignore
Message-Id: <20231106131913.E196986911@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{avro-c,
 python-avro}: bump to version 1.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4b2fc9ae8a45cbfbb853706019aa19e467f3ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index b52a787ed5..83b5759a16 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.1/c/avro-c-1.11.1.tar.gz.sha512
-sha512  e72e8c245a8b86326bc18a5d5127e9beeaceaf805e8a62760fd88d627e29954c750346485bb43822df408c8a172d910c27ddf7e3815bddbdb04d16c54d859323  avro-c-1.11.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.3/c/avro-c-1.11.3.tar.gz.sha512
+sha512  56ce8c6f0b06b779679a6e7a2b738ec94277920e9b3d7c6f1062a0b47db80b90dccf89df9d977ec1f120211f7c2f33845e18df4961818e5c5cc93aaec18e1302  avro-c-1.11.3.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index f217c1d7ed..d7efdc2003 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.11.1
+AVRO_C_VERSION = 1.11.3
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index 0d457a11fd..e57b6a722b 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.1/py/avro-1.11.1.tar.gz.sha512
-sha512  bce5983cd7ed20be848cca41d143f16bf5bab57edc010d590fc1268405de4267e028ff7ec740282a03034aff5aa528feadb2be4e71ee6879b3080e0a9e19cb37  avro-1.11.1.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.3/py/avro-1.11.3.tar.gz.sha512
+sha512  c2066b4dd8b55b0534fb5bb8fc5a81abcef76ab46458b666c98732811f632c34062c1a0cefaf370aa0843c1cad5bd822f9a6ef0ad88cda5177519a3d3c73072d  avro-1.11.3.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 6193cbbd8e..4e9db9fefc 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.11.1
+PYTHON_AVRO_VERSION = 1.11.3
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
