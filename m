Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9791C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70E3540189;
	Tue,  6 Feb 2024 15:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E3540189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvVvSxPV5VbB; Tue,  6 Feb 2024 15:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A80341573;
	Tue,  6 Feb 2024 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A80341573
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB0551BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91A8D6129F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A8D6129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Osr7Y_LVUXNk for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB81D61290
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB81D61290
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9408870F1; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 16:18:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2378442d2b6a3618062d3aaebe3dc7def9aff395
X-Git-Newrev: afbca9230889bc6bbed4d8f9559a8d00cb864461
X-Patchwork-Hint: ignore
Message-Id: <20240206151815.B9408870F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=afbca9230889bc6bbed4d8f9559a8d00cb864461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 0848debc1c..75ecb23053 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  348281a5a27eb5253c7a83927aae64e1  pydantic-2.5.2.tar.gz
-sha256  ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd  pydantic-2.5.2.tar.gz
+md5  4651fb3374d2a0d74442c2cc780770d0  pydantic-2.5.3.tar.gz
+sha256  b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a  pydantic-2.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b5bb7ff853..7ad7abeb8d 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.5.2
+PYTHON_PYDANTIC_VERSION = 2.5.3
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/41/3c8108f79fb7da2d2b17f35744232af4ffcd9e764ebe1e3fd4b26669b325
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152145ecbee663d70a19a45d078180633321efb3847d2562b490
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
