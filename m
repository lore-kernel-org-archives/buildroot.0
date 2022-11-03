Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A30C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36503417A5;
	Thu,  3 Nov 2022 20:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36503417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZVqdo5z8ikt; Thu,  3 Nov 2022 20:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE28F4179D;
	Thu,  3 Nov 2022 20:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE28F4179D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C78C31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2ECC4168D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2ECC4168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODkyeehWfkKq for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9A24162D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9A24162D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BAA787BCC; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2ede119da2d8bf45120c482e11ccb84d31c22afe
X-Git-Newrev: c9b862b2973aaaebac6dacca6ad20f2b20944f87
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.6BAA787BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{avro-c,
 python-avro}: bump to version 1.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9b862b2973aaaebac6dacca6ad20f2b20944f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avro-c/avro-c.hash           | 4 ++--
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 7a4a6f7aca..b52a787ed5 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.0/c/avro-c-1.11.0.tar.gz.sha512
-sha512  5369ec11832e0ce1aa0181d594f657bae82ab5fb317ec1bee5ba190de9ed42956b425a5bf7e423940e8f871a54ae1246b92db2ce8562f270b4a05523ec4b60ae  avro-c-1.11.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.1/c/avro-c-1.11.1.tar.gz.sha512
+sha512  e72e8c245a8b86326bc18a5d5127e9beeaceaf805e8a62760fd88d627e29954c750346485bb43822df408c8a172d910c27ddf7e3815bddbdb04d16c54d859323  avro-c-1.11.1.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index f55c579656..f217c1d7ed 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.11.0
+AVRO_C_VERSION = 1.11.1
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index d752fa8ae6..0d457a11fd 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.0/py/avro-1.11.0.tar.gz.sha512
-sha512  8af67deb33b9990b74ffd7ab5c3c55e13a649070b4623c7bbe2b278287fd0929e57ed6d0344f9e93f3eb79663b43f75891d0810812349dfaecce65fdd9b44e93  avro-1.11.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.1/py/avro-1.11.1.tar.gz.sha512
+sha512  bce5983cd7ed20be848cca41d143f16bf5bab57edc010d590fc1268405de4267e028ff7ec740282a03034aff5aa528feadb2be4e71ee6879b3080e0a9e19cb37  avro-1.11.1.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 42aa11aa4e..6193cbbd8e 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.11.0
+PYTHON_AVRO_VERSION = 1.11.1
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
