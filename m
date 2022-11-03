Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0F2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBA681FBF;
	Thu,  3 Nov 2022 21:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DBA681FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWLmC4cZJ4jt; Thu,  3 Nov 2022 21:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B79815CC;
	Thu,  3 Nov 2022 21:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B79815CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD0A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EC6B40C1C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC6B40C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGx1Pq-JioNR for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E94B340C19
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94B340C19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4FCB87BCA; Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e5672420ba9c4e30d71460b60b3f6207baf12a3
X-Git-Newrev: d77a49554e1caf7322ee6bf43a6a254a60215ccd
X-Patchwork-Hint: ignore
Message-Id: <20221103205513.E4FCB87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pytablewriter:
 bump to version 0.64.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d77a49554e1caf7322ee6bf43a6a254a60215ccd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 27a84f5fda..f082542dfb 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  4909dcdba8c6df35e14dbecbc6c94b6c  pytablewriter-0.46.1.tar.gz
-sha256  9d52ecc84bb89197c312e193b4ff04a3c934b914f3c32e4826d44a0acbc7764f  pytablewriter-0.46.1.tar.gz
+md5  0eaa4a2429d22389b5e4b8c5f5135bbb  pytablewriter-0.64.2.tar.gz
+sha256  99409d401d6ef5f06d1bc40f265a8e3053afe4cbfbaf709f71124076afb40dbb  pytablewriter-0.64.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index a63f7f8a2a..d865a89330 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.46.1
+PYTHON_PYTABLEWRITER_VERSION = 0.64.2
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/bb/86/d5f3dfec35d2d7583c9f3f1d731adf729851d1fe01011f07a747eb8c7df0
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/a6/e1/50c1cd9734a9edc1386913b178f9e4757c1bc37665c1855a6596c25957d6
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
