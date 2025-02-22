Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02DCC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C214F162;
	Fri, 28 Feb 2025 17:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXiI6DxFSH8W; Fri, 28 Feb 2025 17:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69B84F7BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69B84F7BD;
	Fri, 28 Feb 2025 17:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFE01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DBEF470D7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGqafGM8RA0N for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5922142DB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5922142DB1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 531C283577; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:26:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 811993924351dbd122a8da1b012069f5b7115ae9
X-Git-Newrev: 98aec6280a1255b93b0d04e81af1440590ca1f7b
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.531C283577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tftpy: bump to 0.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=98aec6280a1255b93b0d04e81af1440590ca1f7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tftpy/python-tftpy.hash | 2 +-
 package/python-tftpy/python-tftpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 1fae4fdeef..3a040a456a 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bfbf6377f6e3b6ba647f0ac614e9cbc225d1cc35b52991860ba6ea1ec58ef9d  python-tftpy-0.8.2.tar.gz
+sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index fd3c601496..66de17eaab 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.2
+PYTHON_TFTPY_VERSION = 0.8.5
 PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
