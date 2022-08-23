Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EFAC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1777C40447;
	Tue, 23 Aug 2022 19:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1777C40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JaCfaAZkttI; Tue, 23 Aug 2022 19:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E59A40323;
	Tue, 23 Aug 2022 19:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E59A40323
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4C51BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1940D40323
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1940D40323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVx4SsXElrBh for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 484414011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 484414011C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1FC2A87AF7; Tue, 23 Aug 2022 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:27:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7e185002018c9c43664632b13b030c4693eb110b
X-Git-Newrev: 66416e5a8822f90d85dcb0188332a9480f728663
X-Patchwork-Hint: ignore
Message-Id: <20220823191316.1FC2A87AF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/s390-tools: bump to
 version 2.23.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=66416e5a8822f90d85dcb0188332a9480f728663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
- https://release-monitoring.org/project/10714/

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s390-tools/s390-tools.hash |  2 +-
 package/s390-tools/s390-tools.mk   | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index dc9209856b..f74695b81d 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d0f56fe4f6a62dda45ccd87191e42ebfaec82671ff4b96cc2229a7fe240ce072  s390-tools-2.21.0.tar.gz
+sha256  c04d1f7d7f4c941f19a293188eb6302194cc298171f88a4dc17a08a8001c6c01  s390-tools-2.23.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index f381100792..99fc669ce7 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.21.0
+S390_TOOLS_VERSION = 2.23.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
@@ -93,6 +93,20 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_SNMP=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBLOCKFILE),y)
+S390_TOOLS_DEPENDENCIES += liblockfile
+S390_TOOLS_MAKE_OPTS += HAVE_LOCKFILE=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LOCKFILE=0
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+S390_TOOLS_DEPENDENCIES += udev
+S390_TOOLS_MAKE_OPTS += HAVE_LIBUDEV=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LIBUDEV=0
+endif
+
 define S390_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(S390_TOOLS_MAKE_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
