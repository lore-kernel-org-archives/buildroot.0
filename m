Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29708C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF7FC404C9;
	Sun, 11 Dec 2022 09:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF7FC404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFUJ-xioYo76; Sun, 11 Dec 2022 09:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D721D4051F;
	Sun, 11 Dec 2022 09:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D721D4051F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 122EE1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60ADB404E5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60ADB404E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mp9robGZkJZ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79CC7404D8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CC7404D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7391485FA6; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 027ad7bbd6fd6ab57781f0730e9587acb26efc76
X-Git-Newrev: 77871541bdeb7c84e0d54b4d4b3f13a83c5cdb6f
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.7391485FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-influxdb: bump to version
 5.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=77871541bdeb7c84e0d54b4d4b3f13a83c5cdb6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-influxdb/python-influxdb.hash | 4 ++--
 package/python-influxdb/python-influxdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
index 7b43091eca..e86bd8c2ca 100644
--- a/package/python-influxdb/python-influxdb.hash
+++ b/package/python-influxdb/python-influxdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/influxdb/json
-md5  d528c8ccd8ab40bc608ad1e507e7788a  influxdb-5.3.0.tar.gz
-sha256  9bcaafd57ac152b9824ab12ed19f204206ef5df8af68404770554c5b55b475f6  influxdb-5.3.0.tar.gz
+md5  e5888a7023e9a49d8a372538b625f908  influxdb-5.3.1.tar.gz
+sha256  46f85e7b04ee4b3dee894672be6a295c94709003a7ddea8820deec2ac4d8b27a  influxdb-5.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b654917e2c25a69d2bd56e72dddbc6eb29bf7e40384d7c46bb291d5c5185213b  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index e5b1aea70f..d77cb89d2d 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLUXDB_VERSION = 5.3.0
+PYTHON_INFLUXDB_VERSION = 5.3.1
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/be/8d/85ec8f11299a6dfc115244db71fd8f13e9a69f5e9eb77dc3392f4f959e9a
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/86/4f/a9c524576677c1694b149e09d4fd6342e4a1d9a5f409e437168a14d6d150
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
