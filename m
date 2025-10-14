Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F85CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE1D060F0B;
	Tue, 14 Oct 2025 20:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZJYUP5-raDe; Tue, 14 Oct 2025 20:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A103660B43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A103660B43;
	Tue, 14 Oct 2025 20:29:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0751C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9864660B43
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQRGMyMPWJbA for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7DD760AA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7DD760AA9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C431A870FD; Tue, 14 Oct 2025 20:29:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbdd5b816d2abcda55b86493cc5b09867ad1b494
X-Git-Newrev: a66e0bf8f1011e5da1d8466c35a88c08a27d4d1f
X-Patchwork-Hint: ignore
Message-Id: <20251014202936.C431A870FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-executing: bump version to
 2.2.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a66e0bf8f1011e5da1d8466c35a88c08a27d4d1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index ecb64696e9..d9220c224d 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  6d79de70b73814ee0ac523140c47714f  executing-2.2.0.tar.gz
-sha256  5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755  executing-2.2.0.tar.gz
+md5  02588d10820c930874def80b2fb60c4e  executing-2.2.1.tar.gz
+sha256  3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4  executing-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index adb8309bac..0545941d5e 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.2.0
+PYTHON_EXECUTING_VERSION = 2.2.1
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/91/50/a9d80c47ff289c611ff12e63f7c5d13942c65d68125160cefd768c73e6e4
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
