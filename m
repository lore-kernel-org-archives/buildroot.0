Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE5DC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA5DD41EA2;
	Tue,  6 Feb 2024 10:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5DD41EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0UZwnHOzLUL; Tue,  6 Feb 2024 10:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDFAA41E9D;
	Tue,  6 Feb 2024 10:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDFAA41E9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 830A01BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27F4981412
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZajEshP4BEn for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ECD481460
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ECD481460
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E42686F9B; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:28:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c89465332292dcf41ed28fc86ae181d65989c6a4
X-Git-Newrev: 2fc447def738722318fe73fe00da4c10166d012d
X-Patchwork-Hint: ignore
Message-Id: <20240206103429.2E42686F9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-frozenlist: bump to version
 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fc447def738722318fe73fe00da4c10166d012d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 466dd6931b..40a87d2ec0 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  4a14df2fe30853d9e18f73002493a860  frozenlist-1.4.0.tar.gz
-sha256  09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251  frozenlist-1.4.0.tar.gz
+md5  e64b421e8e571623695cd414515f0081  frozenlist-1.4.1.tar.gz
+sha256  c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b  frozenlist-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 10c6bc6314..9333598808 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.4.0
+PYTHON_FROZENLIST_VERSION = 1.4.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8c/1f/49c96ccc87127682ba900b092863ef7c20302a2144b3185412a08480ca22
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
