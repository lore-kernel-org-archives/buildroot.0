Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB7AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E27341E67;
	Tue,  6 Feb 2024 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E27341E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKT0pWZkZjpm; Tue,  6 Feb 2024 10:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602C141E73;
	Tue,  6 Feb 2024 10:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 602C141E73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA661BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E6281412
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GJ9WzNXTh-J for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C20981432
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C20981432
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A1E386F9C; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:28:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b2ec7d40f8ac385f29f9ef740dfa5d92e68f318
X-Git-Newrev: d02aa4dd447ab51c531f52f3c9e7a6057416585e
X-Patchwork-Hint: ignore
Message-Id: <20240206103429.0A1E386F9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-smorest: bump to
 version 0.42.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d02aa4dd447ab51c531f52f3c9e7a6057416585e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index baeddb0e6b..b468c48fd8 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  3d8c01cfe9ec4ba16636d6a3078edc87  flask-smorest-0.42.1.tar.gz
-sha256  7fde3f349d464c408c73b7cbbdb1884c1c36cc8c23b2562aba28d9bdfdd14cdc  flask-smorest-0.42.1.tar.gz
+md5  b10a7a0bdee4505dec3cc7652560bc9e  flask-smorest-0.42.3.tar.gz
+sha256  736ef072bd5522de750a5a9d9f1bfb6d750d05c66e1b3702bc7a20e4277af9bf  flask-smorest-0.42.3.tar.gz
 # Locally computed sha256 checksums
 sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 8a11e96d01..6eb1abc6fa 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.42.1
+PYTHON_FLASK_SMOREST_VERSION = 0.42.3
 PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/be/6e/8e3d0287bfa2da6ca7cf94cd9c053ed209764538dd5fb1d96f535e4d43bb
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/25/91/da55ec1288e821069ab61b6db4acfa171fa268c426523bb4f3a8a91210db
 PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
