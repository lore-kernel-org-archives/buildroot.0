Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F41C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 15:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CC6E40906;
	Fri, 11 Mar 2022 15:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zAxwYE1cOmN; Fri, 11 Mar 2022 15:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76BE4017C;
	Fri, 11 Mar 2022 15:09:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3321BF2B0
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 15:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C23C4094D
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 15:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wK9WbNihMVTU for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 15:09:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ch3vs05.rockwellcollins.com (ch3vs05.rockwellcollins.com
 [205.175.226.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B27A410D0
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 15:09:46 +0000 (UTC)
IronPort-SDR: N0ecZB6GfE7fIPbijxEoTK4z3vKXCWg3z32IqMu0sxIO/mhay/fOqN7F2Iow/+4WmRkvwewf8B
 TO3NUTnYLpTn2EWWQQrhxYfUmrxlaqNj0t0PqeJhsXCg8t+HwFXBisbsBx6vHqs3QeoZutWwhi
 OHqq2Qz8wVD1dnTM/YgKzMMei55x+VpprGZ5MF550JYgwpDfS2kS8DKfAPkmZ0L7LwuTo6TPGg
 y/eku4Yv9JrVrhSSH80vjJtIzjqrmsMYgzY/gzu1kzWJl9sSqeQxeA8HVKViNZjLWYnFAF+smw
 77I=
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs05.rockwellcollins.com with ESMTP; 11 Mar 2022 09:09:45 -0600
X-Received: from jdknight-arch2.rccalab.inside (unknown [10.197.251.26])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 91FB66033F;
 Fri, 11 Mar 2022 09:09:44 -0600 (CST)
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 10:09:43 -0500
Message-Id: <20220311150943.119252-1-james.knight@collins.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.2
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
From: James Knight via buildroot <buildroot@buildroot.org>
Reply-To: James Knight <james.knight@collins.com>
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.2

Signed-off-by: James Knight <james.knight@collins.com>
---
 package/chrony/chrony.hash | 5 +++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index f8dd1438bc7d1f08dcbdccb7bff8e03cee3e2da8..7fa67bf040da0c00e23e3e4fb5ddd4a638cb91d0 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
-sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
+# Locally calculated after checking pgp signature
+# https://download.tuxfamily.org/chrony/chrony-4.2-tar-gz-asc.txt
+sha256  273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a  chrony-4.2.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 5a34f70e1e992f179784ad87b240967f5cf0a30f..15b200aeffe9bd70694bb1d490535ae8785dc3fc 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.1
+CHRONY_VERSION = 4.2
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.30.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
