Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F21C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD462403E0;
	Sat, 17 Sep 2022 13:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD462403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2zELHZ0Rdx4; Sat, 17 Sep 2022 13:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0558240493;
	Sat, 17 Sep 2022 13:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0558240493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 314051BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CFB140223
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CFB140223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMCkcwdiliDw for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:06:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C5840184
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C5840184
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D3376842C8; Sat, 17 Sep 2022 13:06:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:03:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4f76bc0d8861effcf7288ccc5ab2accd079718c
X-Git-Newrev: c54714cac845206ff7b2cb27d7c811ca95a6371c
X-Patchwork-Hint: ignore
Message-Id: <20220917130623.D3376842C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwloc: bump to version 2.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c54714cac845206ff7b2cb27d7c811ca95a6371c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also adds the md5 and sha1 hashes published on the project
download page.

For change log, see:
- https://github.com/open-mpi/hwloc/blob/hwloc-2.8.0/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hwloc/hwloc.hash | 6 ++++--
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index ca77e3301c..b146472195 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,4 +1,6 @@
-# From https://www.open-mpi.org/software/hwloc/v2.7/
-sha256  028cee53ebcfe048283a2b3e87f2fa742c83645fc3ae329134bf5bb8b90384e0  hwloc-2.7.0.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.8/
+md5  1d40ecdded67bbe4bafc8f8e8479376c  hwloc-2.8.0.tar.bz2
+sha1  314faaeda9f1982da97fca93b83307bc34d5b414  hwloc-2.8.0.tar.bz2
+sha256  348a72fcd48c32a823ee1da149ae992203e7ad033549e64aed6ea6eeb01f42c1  hwloc-2.8.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 04543a7e64..3f73b3ecc8 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.7
+HWLOC_VERSION_MAJOR = 2.8
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
