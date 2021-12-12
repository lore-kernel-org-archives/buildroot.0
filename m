Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A850C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02EB040553;
	Sun, 12 Dec 2021 14:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeTCCGPnIiq7; Sun, 12 Dec 2021 14:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06E084019A;
	Sun, 12 Dec 2021 14:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FEFF1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8E2426F1
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Osw8JD1lVtd5 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3DBF426D0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F342A82D96; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:05:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3d80db6172eae0cca48a9fe80af05ee66f12f30
X-Git-Newrev: b4ef47483ebfd8fe7450765b5d9c43e504cef650
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.F342A82D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 8.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4ef47483ebfd8fe7450765b5d9c43e504cef650
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 3b5bdf2535..d14cb5cff6 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a7fc550b80819eab11e01cc097913700  Pillow-8.3.2.tar.gz
-sha256  dde3f3ed8d00c72631bc19cbfff8ad3b6215062a5eed402381ad365f82f0c18c  Pillow-8.3.2.tar.gz
+md5  7a1eb5a250c7ccbd549a89e16404f09f  Pillow-8.4.0.tar.gz
+sha256  b8e2f83c56e141920c39464b852de3719dfbfb6e3c99a2d8da0edf4fb33176ed  Pillow-8.4.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 168c9d632c..5ed57c55cb 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.3.2
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689
+PYTHON_PILLOW_VERSION = 8.4.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/7d/2a/2fc11b54e2742db06297f7fa7f420a0e3069fdcf0e4b57dfec33f0b08622
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
