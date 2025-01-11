Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C045C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4887A500F4;
	Fri, 28 Feb 2025 16:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgKqMTYY1Twp; Fri, 28 Feb 2025 16:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D4BF4F9C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4BF4F9C3;
	Fri, 28 Feb 2025 16:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEA71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 823BD42EC7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3YM-J_cm23C for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A854542D23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A854542D23
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A015D86A52; Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:30:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea6fb2554bd0607b94b801471e520829f006ee9c
X-Git-Newrev: 616dafb36581c142aa57c23c18c810f25e14a9d1
X-Patchwork-Hint: ignore
Message-Id: <20250228163003.A015D86A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-hiredis: bump
 to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=616dafb36581c142aa57c23c18c810f25e14a9d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index d4d98d85df..07b0d96582 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  c0b7f7def9f945e8a900a4275df2d3af  hiredis-3.0.0.tar.gz
-sha256  fed8581ae26345dea1f1e0d1a96e05041a727a45e7d8d459164583e23c6ac441  hiredis-3.0.0.tar.gz
+md5  56a3997b44753c11a0cdb2dc4aa50352  hiredis-3.1.0.tar.gz
+sha256  51d40ac3611091020d7dea6b05ed62cb152bff595fa4f931e7b6479d777acf7c  hiredis-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 59e036c845..b938650caf 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.0.0
+PYTHON_HIREDIS_VERSION = 3.1.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/8b/80/740fb0dfa7a42416ce8376490f41dcdb1e5deed9c3739dfe4200fad865a9
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/e5/789cfa8993ced0061a6ef7ea758302ef5cf3439629bf0d39c85a6ede4641
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
