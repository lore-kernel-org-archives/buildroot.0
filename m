Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F8BC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 597774071E;
	Fri, 16 May 2025 14:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKY7y3XcbT2Q; Fri, 16 May 2025 14:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB614077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB614077F;
	Fri, 16 May 2025 14:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA9613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E676129D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pztFIrmnjff for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D999960841
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D999960841
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:21:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7E8386BD1; Fri, 16 May 2025 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0814b614c255abedefe5f65564f0871dbcafab9e
X-Git-Newrev: 873e1d658ae6cad0b19b8e7b1988b9337bfd9a23
X-Patchwork-Hint: ignore
Message-Id: <20250516142129.C7E8386BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.115.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=873e1d658ae6cad0b19b8e7b1988b9337bfd9a23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-fastapi/Config.in           | 2 +-
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index d4a527c601..21997daf9a 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	  FastAPI framework, high performance, easy to learn, fast to
 	  code, ready for production.
 
-	  https://github.com/tiangolo/fastapi
+	  https://github.com/fastapi/fastapi
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index a241937ce5..41b208a8a7 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  38428aff025530f61cd5b10efd764229  fastapi-0.115.8.tar.gz
-sha256  0ce9111231720190473e222cdf0f07f7206ad7e53ea02beb1d2dc36e2f0741e9  fastapi-0.115.8.tar.gz
+md5  af68daf64073e04653b314a895aee297  fastapi-0.115.12.tar.gz
+sha256  1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681  fastapi-0.115.12.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 2662f3ddaf..95961972fe 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.8
+PYTHON_FASTAPI_VERSION = 0.115.12
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a2/b2/5a5dc4affdb6661dea100324e19a7721d5dc524b464fe8e366c093fd7d87
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/f4/55/ae499352d82338331ca1e28c7f4a63bfd09479b16395dce38cf50a39e2c2
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
