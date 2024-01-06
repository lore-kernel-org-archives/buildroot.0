Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E3CC47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD5D83DD6;
	Sat,  6 Jan 2024 09:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD5D83DD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EwKQ6xoysNM; Sat,  6 Jan 2024 09:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D010C84029;
	Sat,  6 Jan 2024 09:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D010C84029
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9FDB1BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C329642184
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C329642184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tvNK09lUvN9 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C0842175
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C0842175
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF1928468B; Sat,  6 Jan 2024 09:55:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:51:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 059259eabbd8d15c1e60c0c3b8631d0c02b93898
X-Git-Newrev: 8f1c70441338ba6a8c5214edc9c1072a0356e002
X-Patchwork-Hint: ignore
Message-Id: <20240106095523.CF1928468B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supervisor: bump to version 4.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f1c70441338ba6a8c5214edc9c1072a0356e002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop COPYRIGHT as license text has been removed from this file with
https://github.com/Supervisor/supervisor/commit/7fd2842162d026eee929e2673de37039c42aa5a7

http://supervisord.org/changes.html#id1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supervisor/supervisor.hash | 3 +--
 package/supervisor/supervisor.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index f6e9cf97b1..a61afc4410 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256  5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90  supervisor-4.2.2.tar.gz
-sha256  7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
+sha256  34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12  supervisor-4.2.5.tar.gz
 sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index ad34c031e4..eb2a4990b7 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.2.2
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/d3/7f/c780b7471ba0ff4548967a9f7a8b0bfce222c3a496c3dfad0164172222b0
+SUPERVISOR_VERSION = 4.2.5
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/ce/37/517989b05849dd6eaa76c148f24517544704895830a50289cbbf53c7efb9
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
-SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
+SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
 SUPERVISOR_SETUP_TYPE = setuptools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
