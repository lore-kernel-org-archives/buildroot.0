Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C9FC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B58EE40B05;
	Mon,  5 Feb 2024 17:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B58EE40B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSNawK5Ia4WW; Mon,  5 Feb 2024 17:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B516640A61;
	Mon,  5 Feb 2024 17:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B516640A61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8CD1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06132815AB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06132815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIhZ3-dYFHks for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:45:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368A781586
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368A781586
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2459186D9A; Mon,  5 Feb 2024 17:45:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:44:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 999c0fbc9f951536f6a1fda42fb7bf406da5f3a0
X-Git-Newrev: fb6163cf96de64ac6df271f3080fce4dacaa7a71
X-Patchwork-Hint: ignore
Message-Id: <20240205174526.2459186D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.5.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb6163cf96de64ac6df271f3080fce4dacaa7a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-gnupg/python-gnupg.hash | 7 ++-----
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index d52b634b8d..4a194ad41e 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,8 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-# also checked PGP signature from:
-# https://bitbucket.org/vinay.sajip/python-gnupg/downloads/python-gnupg-0.5.1.tar.gz.asc
-# with key: 9147B477339A9B86
-md5  c5d99c5f0456f8cbf69324ec5e6acaff  python-gnupg-0.5.1.tar.gz
-sha256  5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8  python-gnupg-0.5.1.tar.gz
+md5  b263ea268692cfe687d29d52daab4770  python-gnupg-0.5.2.tar.gz
+sha256  01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c  python-gnupg-0.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index f582f4cdb7..ddf2287f9b 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.1
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/62/7737485f44bd4d7d904f4094372f4119195865b29f119fa51a98e121a13a
+PYTHON_GNUPG_VERSION = 0.5.2
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/5d/4425390ad81d22b330a1b0df204c4d39fb3cb7c39e081d51e9f7426ce716
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
