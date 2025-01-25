Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E403C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED916FB71;
	Fri, 28 Feb 2025 16:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cg899-fthjfJ; Fri, 28 Feb 2025 16:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180346FC24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180346FC24;
	Fri, 28 Feb 2025 16:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C91E668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B62C340413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VXqtLDE18Pt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81AC41643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81AC41643
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96AEB87A55; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 15:41:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4dce8441b97261d56a14df0016514e2515a9e02
X-Git-Newrev: c8d95d0f8cd5933b5f29786b901d56b620ed4533
X-Patchwork-Hint: ignore
Message-Id: <20250228163019.96AEB87A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-more-itertools:
 bump to version 10.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8d95d0f8cd5933b5f29786b901d56b620ed4533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index a7983a4449..a9b5d00f6b 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  43150affe17a010264115f2caea5de70  more-itertools-10.5.0.tar.gz
-sha256  5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6  more-itertools-10.5.0.tar.gz
+md5  48da05632079828fd2e89e238192bb69  more-itertools-10.6.0.tar.gz
+sha256  2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b  more-itertools-10.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 8fac2abac2..8c520c790a 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.5.0
+PYTHON_MORE_ITERTOOLS_VERSION = 10.6.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/51/78/65922308c4248e0eb08ebcbe67c95d48615cc6f27854b6f2e57143e9178f
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/88/3b/7fa1fe835e2e93fd6d7b52b2f95ae810cf5ba133e1845f726f5a992d62c2
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
