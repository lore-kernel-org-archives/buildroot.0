Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648CAC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E8C260D90;
	Tue, 18 Mar 2025 15:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSKUPRjb_gIY; Tue, 18 Mar 2025 15:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543E560906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543E560906;
	Tue, 18 Mar 2025 15:04:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D3016E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A04981EF3
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2qCApu-55-s for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22332814B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22332814B7
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FACC880EC; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 23:11:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe43cf9c9522d992cf2d5b57442297bb8567f659
X-Git-Newrev: 7c9ac213d4a5f8ce89a00b461d16e78e5652a54a
X-Patchwork-Hint: ignore
Message-Id: <20250318150242.1FACC880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c9ac213d4a5f8ce89a00b461d16e78e5652a54a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 3e762c5029..3279977431 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  26d1dc6e53395f537667d66ba1832ea7  websockets-14.2.tar.gz
-sha256  5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5  websockets-14.2.tar.gz
+md5  753a523e3de5b0f32927e590b910dfde  websockets-15.0.tar.gz
+sha256  ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab  websockets-15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 2de0b32d58..a39c7580ef 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 14.2
+PYTHON_WEBSOCKETS_VERSION = 15.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/94/54/8359678c726243d19fae38ca14a334e740782336c9f19700858c4eb64a1e
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/2e/7a/8bc4d15af7ff30f7ba34f9a172063bfcee9f5001d7cef04bee800a658f33
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
