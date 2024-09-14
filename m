Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68598C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2487780C88;
	Sun, 15 Sep 2024 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzoJ3ucieNQz; Sun, 15 Sep 2024 21:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B68881A6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B68881A6F;
	Sun, 15 Sep 2024 21:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35B6D1BF954
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90CB400A4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijyRn7eSUJr6 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FEA040A0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FEA040A0E
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 572B683682; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:51:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56282c3b12b2dc8057ee5cde390b5b53ae59b56e
X-Git-Newrev: 1f2507a6df1699c511e402145f47e1c3513dc746
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.572B683682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alsaaudio: bump to version
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f2507a6df1699c511e402145f47e1c3513dc746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index ab8b868b97..205130f30b 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  720b2e1a47a5fdb587ea1b4eabbd23e6  pyalsaaudio-0.10.0.tar.gz
-sha256  e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab  pyalsaaudio-0.10.0.tar.gz
+md5  8c11664f8787e3d9900d666f15565713  pyalsaaudio-0.11.0.tar.gz
+sha256  a78a9dca33524b2c9064b34e21f5ab874272313cf324a9a77592f396a5e0fddc  pyalsaaudio-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 0692f4a8e9..4b3276842e 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.10.0
+PYTHON_ALSAAUDIO_VERSION = 0.11.0
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/e5/f0/411140b1c2d8eea8531233f39103e7ebda560030493e298be6439ce36936
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/21/a6/3d833079b030d449345e35ce0e2874e330d3612135734f07b9ceace25bcf
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
