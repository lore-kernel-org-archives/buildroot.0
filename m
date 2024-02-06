Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BAEC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6284826BB;
	Tue,  6 Feb 2024 12:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzFHQFg3NUcM; Tue,  6 Feb 2024 12:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82BB3826DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BB3826DE;
	Tue,  6 Feb 2024 12:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70B731BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0460781E14
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P89SxH9Wxw9L for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3579D8228C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3579D8228C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23DBD8702A; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 13:58:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94dd060c8f8a00e1bf9dc8072c3c4c543866c946
X-Git-Newrev: 914040cb73a7b3d2082b70e05fba4a2c1268732e
X-Patchwork-Hint: ignore
Message-Id: <20240206125834.23DBD8702A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 10.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=914040cb73a7b3d2082b70e05fba4a2c1268732e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/python-pillow/Pillow/commit/ee6e12a8032a8255b2f7a60a40c50377c17a03fe

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 92258a6712..001fb62676 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a55618c5d2fd64048dd3ea41bc39f7cd  Pillow-10.1.0.tar.gz
-sha256  e6bf8de6c36ed96c86ea3b6e1d5273c53f46ef518a062464cd7ef5dd2cf92e38  Pillow-10.1.0.tar.gz
+md5  13de96f9f98bc1c26439d64576a48ac6  pillow-10.2.0.tar.gz
+sha256  e87f0b2c78157e12d7686b27d63c070fd65d994e8ddae6f328e0dcf4a0cd007e  pillow-10.2.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
+sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index bc94062da8..10939d8467 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/80/d7/c4b258c9098b469c4a4e77b0a99b5f4fd21e359c2e486c977d231f52fc71
-PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
+PYTHON_PILLOW_VERSION = 10.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f8/3e/32cbd0129a28686621434cbf17bb64bf1458bfb838f1f668262fefce145c
+PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
