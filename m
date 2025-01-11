Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB207C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF8D70466;
	Fri, 28 Feb 2025 16:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x4x2hLzbtXG; Fri, 28 Feb 2025 16:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A0D7045B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A0D7045B;
	Fri, 28 Feb 2025 16:55:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0F21DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 090A644FD4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piL2FrI4IcpQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA8E4254A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA8E4254A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10FDF86A52; Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 18:38:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34f8413fd8d6692e825978783800bb4555e8df22
X-Git-Newrev: 3d871e4f7098cce042f3e857f80c0ff22ad4c8bc
X-Patchwork-Hint: ignore
Message-Id: <20250228163005.10FDF86A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pycares: bump
 to version 4.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d871e4f7098cce042f3e857f80c0ff22ad4c8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index fa24c1ec66..95558f0477 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  ff4e54e91e32484b189b1e28758ec8c7  pycares-4.4.0.tar.gz
-sha256  f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b30733e1c2  pycares-4.4.0.tar.gz
+md5  5824db5d38e1aa13a412e2b8bbe52160  pycares-4.5.0.tar.gz
+sha256  025b6c2ffea4e9fb8f9a097381c2fecb24aff23fbd6906e70da22ec9ba60e19d  pycares-4.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index fe6916445d..31153434ef 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.4.0
+PYTHON_PYCARES_VERSION = 4.5.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/1b/8f/daf60bbc06f4a3cd1cfb0ab807057151287df6f5c78f2e0d298acc9193ac
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/d7/b1/94daaa50b6d2fa14c6b4981ca24fa4e7aa33a7519962c76170072ffb06ee
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
