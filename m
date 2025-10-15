Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86D4CCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609ED84042;
	Wed, 15 Oct 2025 07:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XZXV01NC2VR; Wed, 15 Oct 2025 07:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9EB84043
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9EB84043;
	Wed, 15 Oct 2025 07:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA131BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6677741071
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SASwlZLYwvOQ for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A949441046
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A949441046
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 989958710A; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 08:04:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5229b57cda9fedb0c26123241d4fcdc18e8c96c2
X-Git-Newrev: f313896f0d163a0eb0e1422b2cdc40d6a7f5725f
X-Patchwork-Hint: ignore
Message-Id: <20251015071659.989958710A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio-websocket: bump
 version to 0.12.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f313896f0d163a0eb0e1422b2cdc40d6a7f5725f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-trio-websocket/python-trio-websocket.hash | 4 ++--
 package/python-trio-websocket/python-trio-websocket.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
index b7e8302b58..3c73f33f37 100644
--- a/package/python-trio-websocket/python-trio-websocket.hash
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trio-websocket/json
-md5  3d9bb51b62f562dbdbc2ec067132c4a6  trio-websocket-0.11.1.tar.gz
-sha256  18c11793647703c158b1f6e62de638acada927344d534e3c7628eedcb746839f  trio-websocket-0.11.1.tar.gz
+md5  d46fc1eddcd2b3bcb704d4cba65ad663  trio_websocket-0.12.2.tar.gz
+sha256  22c72c436f3d1e264d0910a3951934798dcc5b00ae56fc4ee079d46c7cf20fae  trio_websocket-0.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2d5e3fc506b6c87ad93b77b9aa76009a58fea72be5fb56e6803bc08cb2887999  LICENSE
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
index 3e79bb7108..f4a9304f15 100644
--- a/package/python-trio-websocket/python-trio-websocket.mk
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_WEBSOCKET_VERSION = 0.11.1
-PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
-PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/dd/36/abad2385853077424a11b818d9fd8350d249d9e31d583cb9c11cd4c85eda
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.12.2
+PYTHON_TRIO_WEBSOCKET_SOURCE = trio_websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d1/3c/8b4358e81f2f2cfe71b66a267f023a91db20a817b9425dd964873796980a
 PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
 PYTHON_TRIO_WEBSOCKET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
