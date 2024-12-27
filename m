Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1827C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9177F41457;
	Fri, 28 Feb 2025 16:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nrqb05C6d8x3; Fri, 28 Feb 2025 16:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A5C4FB42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A5C4FB42;
	Fri, 28 Feb 2025 16:45:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B171DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D161E42D15
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAw2np55J-6B for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF9042543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AF9042543
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F196867C0; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:18:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1a8acde4c882909d752f1ad863b8fd78e6468fa
X-Git-Newrev: 18e18706c0dac91a1e7ba06a13c773200beb64b3
X-Patchwork-Hint: ignore
Message-Id: <20250228162948.1F196867C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cppy: bump to
 version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=18e18706c0dac91a1e7ba06a13c773200beb64b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cppy/python-cppy.hash | 4 ++--
 package/python-cppy/python-cppy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
index 45b78eab8e..73049c6df1 100644
--- a/package/python-cppy/python-cppy.hash
+++ b/package/python-cppy/python-cppy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cppy/json
-md5  7c1f825c43dd66454440932a35b9969c  cppy-1.2.1.tar.gz
-sha256  83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b  cppy-1.2.1.tar.gz
+md5  522447d934d18484cd4cfe90c1872628  cppy-1.3.0.tar.gz
+sha256  da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604  cppy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index 5bfd5a0f16..3253956672 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CPPY_VERSION = 1.2.1
+PYTHON_CPPY_VERSION = 1.3.0
 PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
-PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee52d2f0423046072a2ce3ae16dfcd44373b9fe2a0222204
+PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/1e/84/62a09daa04e732a5763ec22dbc11b988e5140a77b418ea70bba9ab1a77a5
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
