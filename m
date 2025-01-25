Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7613BC0218D
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7C14062F;
	Sat, 25 Jan 2025 14:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NloGyeXaVEG; Sat, 25 Jan 2025 14:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E241140331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E241140331;
	Sat, 25 Jan 2025 14:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FCF1DA8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A98AD80E4D
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WrFo_zddHWf for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A2D80D92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A2D80D92
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD84F8637F; Sat, 25 Jan 2025 14:32:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:19:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37e3db83292dfe3f233b16e2cc743cb94cd865b6
X-Git-Newrev: afd416010be89bc0bbf67073f1ae1cbf7ea285bf
X-Patchwork-Hint: ignore
Message-Id: <20250125143246.BD84F8637F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-executing: bump to version
 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=afd416010be89bc0bbf67073f1ae1cbf7ea285bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index 8f02628485..ecb64696e9 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  e64dd9916bb0a6c89f88295f4867c1b6  executing-2.1.0.tar.gz
-sha256  8ea27ddd260da8150fa5a708269c4a10e76161e2496ec3e587da9e3c0fe4b9ab  executing-2.1.0.tar.gz
+md5  6d79de70b73814ee0ac523140c47714f  executing-2.2.0.tar.gz
+sha256  5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755  executing-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index d13da22be3..adb8309bac 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.1.0
+PYTHON_EXECUTING_VERSION = 2.2.0
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8c/e3/7d45f492c2c4a0e8e0fad57d081a7c8a0286cdd86372b070cca1ec0caa1e
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/91/50/a9d80c47ff289c611ff12e63f7c5d13942c65d68125160cefd768c73e6e4
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
