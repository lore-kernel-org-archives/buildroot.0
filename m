Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F0DD116FC
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 06:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A121660861;
	Fri, 25 Oct 2024 06:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PQmlDVj-6nx; Fri, 25 Oct 2024 06:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95FF60839
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95FF60839;
	Fri, 25 Oct 2024 06:16:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 344112318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C0A6064E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5z1d8Y7FYYF for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 06:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 739B460839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 739B460839
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:16:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5968F83609; Fri, 25 Oct 2024 06:16:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 08:15:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9cc3f8d9d0e9ab79a62372de30274d2aa0b3336
X-Git-Newrev: b6bc0912720206fa22a250b67f6a4d75bcdf8141
X-Patchwork-Hint: ignore
Message-Id: <20241025061624.5968F83609@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump version to 3.12.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6bc0912720206fa22a250b67f6a4d75bcdf8141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.python.org/2024/10/python-3127-released.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 0cd852c325..ad73a85a7f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3126/
-md5  cb669514937d3e894e74081627722aa5  Python-3.12.6.tar.xz
+# From https://www.python.org/downloads/release/python-3127/
+md5  c6c933c1a0db52597cb45a7910490f93  Python-3.12.7.tar.xz
 # Locally computed
-sha256  1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c  Python-3.12.6.tar.xz
+sha256  24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550  Python-3.12.7.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4b328f70fb..d029d3dbbc 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
