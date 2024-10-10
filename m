Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81E6D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C94412E6;
	Thu, 10 Oct 2024 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FweCcaLV-gJ1; Thu, 10 Oct 2024 21:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E44441380
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E44441380;
	Thu, 10 Oct 2024 21:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13CBC1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14CF6404F0
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdGNAu2CL1Yz for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A94411A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A94411A1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A99E185C59; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7d8d2ef92f078af8769ad3a0c707efa4faa7f93
X-Git-Newrev: 9300e6a73ee96500a046cce449d14a7a159e17da
X-Patchwork-Hint: ignore
Message-Id: <20241010213042.A99E185C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore: bump to version
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9300e6a73ee96500a046cce449d14a7a159e17da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httpcore/python-httpcore.hash | 4 ++--
 package/python-httpcore/python-httpcore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
index e773374c05..68c0450f94 100644
--- a/package/python-httpcore/python-httpcore.hash
+++ b/package/python-httpcore/python-httpcore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore/json
-md5  17916ce84db1c0705af60a61bbec9061  httpcore-1.0.5.tar.gz
-sha256  34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61  httpcore-1.0.5.tar.gz
+md5  458f9b56367cf547425bf2347bffd784  httpcore-1.0.6.tar.gz
+sha256  73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f  httpcore-1.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index ae29d8dc8a..19edf18c97 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE_VERSION = 1.0.5
+PYTHON_HTTPCORE_VERSION = 1.0.6
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
 PYTHON_HTTPCORE_SETUP_TYPE = pep517
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
