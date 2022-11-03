Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E91C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D5661054;
	Thu,  3 Nov 2022 21:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D5661054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4r_AzMZ2GFT; Thu,  3 Nov 2022 21:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB97661040;
	Thu,  3 Nov 2022 21:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB97661040
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20AD11BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A2A40C18
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A2A40C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 769PPcN5xRpK for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB1040C2A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB1040C2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D84A87BCD; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2a76ef23ae323fd0d571dd2f0c218201921c06bf
X-Git-Newrev: 2a10f8e21100420026666c171b38d279ec2fecc5
X-Patchwork-Hint: ignore
Message-Id: <20221103205514.8D84A87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-simplesqlite:
 bump to version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a10f8e21100420026666c171b38d279ec2fecc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Verified license remains MIT after hash change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simplesqlite/python-simplesqlite.hash | 6 +++---
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 404670aef3..06edbfab3d 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  f1d4f2ec14e2c782a62e451587477598  SimpleSQLite-0.45.2.tar.gz
-sha256  0b19c99c36b63173a715649f94a2fc3aee8deb9b70c683d584bca85e5930244b  SimpleSQLite-0.45.2.tar.gz
+md5  11f2ef73243fb0d677ed00d22f1441b2  SimpleSQLite-1.3.0.tar.gz
+sha256  f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8  SimpleSQLite-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index 88ffcd4d45..ea60cefc16 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 0.45.2
+PYTHON_SIMPLESQLITE_VERSION = 1.3.0
 PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/b3/d1/bc3668ed7d90ee70d556124b8b5b3329505d72b5290bb393626f1afe714d
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/a0/2c/39a9e7dc4af46d101f48753086c686982790ecc2bdf5e9fa88f85f027e7a
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
