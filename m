Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB92C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D526FACF;
	Fri, 28 Feb 2025 16:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZoZBPp291RO; Fri, 28 Feb 2025 16:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11A096FC6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A096FC6F;
	Fri, 28 Feb 2025 16:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F05A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E53D43422
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ge5TBRjM7p9a for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D372042D24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D372042D24
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C277C87C2C; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:30:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 43ec8779b09854a565a51e80df6b8ea9730fe4f3
X-Git-Newrev: cf711bf9b374468606eac045a92f1fe4076e825f
X-Patchwork-Hint: ignore
Message-Id: <20250228163003.C277C87C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-inflect: bump
 to version 7.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf711bf9b374468606eac045a92f1fe4076e825f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-inflect/python-inflect.hash | 4 ++--
 package/python-inflect/python-inflect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 8b373b8a7e..1538bfa178 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  7201084aafe65ed5925a8f055f9281a7  inflect-7.4.0.tar.gz
-sha256  904baa17cc2cb74827a6c27b95692e95670dadc72b208b3e8c1c05aeed47026b  inflect-7.4.0.tar.gz
+md5  2b4c0c942b110c587d8cc1acfb606882  inflect-7.5.0.tar.gz
+sha256  faf19801c3742ed5a05a8ce388e0d8fe1a07f8d095c82201eb904f5d27ad571f  inflect-7.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index 926f2c43ef..21e87aea35 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.4.0
+PYTHON_INFLECT_VERSION = 7.5.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/e1/dc/02614acece4d578e709c606594c989cfd9f15cf6401444e5603e60df9b26
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/78/c6/943357d44a21fd995723d07ccaddd78023eace03c1846049a2645d4324a3
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
