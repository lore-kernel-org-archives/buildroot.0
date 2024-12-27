Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C2FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDA54F05E;
	Fri, 28 Feb 2025 16:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eub96FjmuMfH; Fri, 28 Feb 2025 16:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221DC42D2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221DC42D2E;
	Fri, 28 Feb 2025 16:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CFD7711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D3242D36
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBEle4ps_-a3 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1361842542
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1361842542
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B4FE843B6; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:16:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b780b066a1c087d20707d79bd17ec4d803a10bf1
X-Git-Newrev: c1a8acde4c882909d752f1ad863b8fd78e6468fa
X-Patchwork-Hint: ignore
Message-Id: <20250228162948.0B4FE843B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-contourpy: bump
 to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1a8acde4c882909d752f1ad863b8fd78e6468fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-contourpy/python-contourpy.hash | 4 ++--
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index 8902607ec8..aef7c3de74 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  81447a2ceaf933b28db04d02086a22ed  contourpy-1.3.0.tar.gz
-sha256  7ffa0db17717a8ffb127efd0c95a4362d996b892c2904db72428d5b52e1938a4  contourpy-1.3.0.tar.gz
+md5  06a4ae6ab30b855514797cac7073ed08  contourpy-1.3.1.tar.gz
+sha256  dfd97abd83335045a913e3bcc4a09c0ceadbe66580cf573fe961f4a825efa699  contourpy-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c7d0a153bffaa104044463ebc633793d451722efd3138b5ffd2527b40f1505a2  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 3804fce8c3..08c45f3805 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.0
+PYTHON_CONTOURPY_VERSION = 1.3.1
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/f5/f6/31a8f28b4a2a4fa0e01085e542f3081ab0588eff8e589d39d775172c9792
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/25/c2/fc7193cc5383637ff390a712e88e4ded0452c9fbcf84abe3de5ea3df1866
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
