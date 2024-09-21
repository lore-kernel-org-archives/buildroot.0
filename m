Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF4BCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FAD60DF0;
	Sat, 21 Sep 2024 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-3CMurO_6E7; Sat, 21 Sep 2024 21:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3265C608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3265C608FB;
	Sat, 21 Sep 2024 21:11:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127DC1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 919CC60802
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ismIwRjLuwR7 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E03607F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E03607F7
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C061282200; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe8ff668627b2f96fdf00d97a932fb7699e68a31
X-Git-Newrev: 904cbaafce9fe93c82e691ad9401f7d3b08d0100
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.C061282200@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-schedule: bump to version
 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=904cbaafce9fe93c82e691ad9401f7d3b08d0100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-schedule/python-schedule.hash | 4 ++--
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 59c84c2002..abbf07ffb9 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5  ecb436a797e1a149bac4643330b268ca  schedule-1.2.1.tar.gz
-sha256  843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279  schedule-1.2.1.tar.gz
+md5  e9a2733aad7fb33107444a53f8b87d48  schedule-1.2.2.tar.gz
+sha256  15fe9c75fe5fd9b9627f3f19cc0ef1420508f9f9a46f45cd0769ef75ede5f0b7  schedule-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index 11be2e49d4..f78b2dcb11 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 1.2.1
+PYTHON_SCHEDULE_VERSION = 1.2.2
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/29/22/9dd374cbf76a42ece1f1f41cc8f4957f0ad512577372527cd3dd52758241
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/0c/91/b525790063015759f34447d4cf9d2ccb52cdee0f1dd6ff8764e863bcb74c
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
