Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D485C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6085383C88;
	Wed,  7 Feb 2024 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trkEEgcPXQRs; Wed,  7 Feb 2024 16:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D7C383C93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D7C383C93;
	Wed,  7 Feb 2024 16:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9260A1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ED6E41553
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfqgUpw6Mvn2 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5874D40568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5874D40568
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F64A8767A; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:39:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b62384e3d2a9e1d200b5b99783bd3d1611175ea
X-Git-Newrev: d1269073e7b4a2a7f92ebfe88581eaf9e09616a5
X-Patchwork-Hint: ignore
Message-Id: <20240207164326.4F64A8767A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sh: bump to version 2.0.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1269073e7b4a2a7f92ebfe88581eaf9e09616a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index a31aacdee1..c0d3f62f12 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  d60498172876f35aef6303a9cbb8eb11  sh-1.14.3.tar.gz
-sha256  e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7  sh-1.14.3.tar.gz
+md5  aadf37759a9cb4862257cef3cf44a27b  sh-2.0.6.tar.gz
+sha256  9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1  sh-2.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 781de88ab1..af4da3f6c9 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.14.3
+PYTHON_SH_VERSION = 2.0.6
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/b7/09/89c28aaf2a49f226fef8587c90c6386bd2cc03a0295bc4ff7fc6ee43c01d
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
