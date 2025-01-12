Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183FCC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4616FC56;
	Fri, 28 Feb 2025 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIeBxVACYxKK; Fri, 28 Feb 2025 16:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D763070494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D763070494;
	Fri, 28 Feb 2025 16:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C10568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C306C42551
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJ5RWx3gwCOU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB4D5424E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB4D5424E5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C32DD87C2C; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:03:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e0dffe6cef324390241881498b8914b3811b5990
X-Git-Newrev: 943d3390c67bc899026c7ddcdc1b0288256bde04
X-Patchwork-Hint: ignore
Message-Id: <20250228163006.C32DD87C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sh: bump to
 version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=943d3390c67bc899026c7ddcdc1b0288256bde04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index 79a34056dc..4ed2464260 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  eba6bd8ec843a707bdc481577835980d  sh-2.1.0.tar.gz
-sha256  7e27301c574bec8ca5bf6f211851357526455ee97cd27a7c4c6cc5e2375399cb  sh-2.1.0.tar.gz
+md5  d1bc1f56e6a99109fb0f589aba574cf2  sh-2.2.1.tar.gz
+sha256  287021ae84183dea49787985e33797dda7fe769e4f95f2c94dff8e245ab4cb00  sh-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index a59c6f1324..84ad1aec63 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.1.0
+PYTHON_SH_VERSION = 2.2.1
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/52/12/b7965006c5adc57ba5459385358bd27c4983cd490884a75be86eb1d3efeb
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/bd/30/abf254f7b56ba7bcae938767e3ee0f54d220d931a35a8721de350b76dec5
 PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
