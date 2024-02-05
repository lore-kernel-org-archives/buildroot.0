Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBCC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D04E141829;
	Mon,  5 Feb 2024 11:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D04E141829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzGhin4nUoZv; Mon,  5 Feb 2024 11:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC63419C3;
	Mon,  5 Feb 2024 11:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC63419C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16DE61BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B19AA41766
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19AA41766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CRNUJRCGY0o for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9024418A9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9024418A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C550E86C05; Mon,  5 Feb 2024 11:37:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:36:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac774255e87a934f43f8048f7dd9a9d82de79cd0
X-Git-Newrev: 435f71ad2ef340b0e89a77702c1e273bb4dad1a5
X-Patchwork-Hint: ignore
Message-Id: <20240205113720.C550E86C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-schedule: bump to version
 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=435f71ad2ef340b0e89a77702c1e273bb4dad1a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-schedule/python-schedule.hash | 4 ++--
 package/python-schedule/python-schedule.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 3d67be0f5e..59c84c2002 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5  9bf7544e37824e450457187633a17b17  schedule-1.1.0.tar.gz
-sha256  e6ca13585e62c810e13a08682e0a6a8ad245372e376ba2b8679294f377dfc8e4  schedule-1.1.0.tar.gz
+md5  ecb436a797e1a149bac4643330b268ca  schedule-1.2.1.tar.gz
+sha256  843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279  schedule-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index fc6081cf22..11be2e49d4 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 1.1.0
+PYTHON_SCHEDULE_VERSION = 1.2.1
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/a8/b5/a291a4c0faa491fd5baefa6d89011ece581cff47b23c0a39b42a63383358
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/29/22/9dd374cbf76a42ece1f1f41cc8f4957f0ad512577372527cd3dd52758241
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
