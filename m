Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB4C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C6250537;
	Fri, 28 Feb 2025 17:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-wLx7Pn3Qb5; Fri, 28 Feb 2025 17:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 841DF5053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 841DF5053A;
	Fri, 28 Feb 2025 17:03:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FDBF68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D9A240DCB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlQzSkUrVQJG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6153C42E96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6153C42E96
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 587C487A55; Fri, 28 Feb 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:21:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 170b737330cdab8a42910b0f0a4475069554a393
X-Git-Newrev: 980dbc154956e4511a84f3bf432b518686152ba1
X-Patchwork-Hint: ignore
Message-Id: <20250228163019.587C487A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-hyperframe:
 bump to version 6.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=980dbc154956e4511a84f3bf432b518686152ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hyperframe/python-hyperframe.hash | 4 ++--
 package/python-hyperframe/python-hyperframe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
index b39ab51a72..a3abf27b15 100644
--- a/package/python-hyperframe/python-hyperframe.hash
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperframe/json
-md5  153c064e8ac654aaf136b3388c36de48  hyperframe-6.0.1.tar.gz
-sha256  ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914  hyperframe-6.0.1.tar.gz
+md5  fda90f638a3db3e8f1837c2e0ade8f08  hyperframe-6.1.0.tar.gz
+sha256  f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08  hyperframe-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 4b13ca51a3..3ebbf4cee5 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERFRAME_VERSION = 6.0.1
+PYTHON_HYPERFRAME_VERSION = 6.1.0
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/5a/2a/4747bff0a17f7281abe73e955d60d80aae537a5d203f417fa1c2e7578ebb
+PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/02/e7/94f8232d4a74cc99514c13a9f995811485a6903d48e5d952771ef6322e30
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
