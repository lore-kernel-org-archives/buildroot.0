Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A050C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 13:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F5B410D4;
	Tue, 27 Sep 2022 13:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F5B410D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7j2V5oYv5sa; Tue, 27 Sep 2022 13:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDBC410A7;
	Tue, 27 Sep 2022 13:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDBC410A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF031BF47A
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 13:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47B3E4048B
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 13:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B3E4048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7e6Y1iI_ej-n for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 13:40:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69956403C2
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69956403C2
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 13:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 75E0F39857;
 Tue, 27 Sep 2022 15:05:43 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 15:05:42 +0200
Message-Id: <1664283942-24229-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH] package/python-remi: bump version to 2022.7.27
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 4e1786a952..82234bbe98 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,2 @@
 # sha256 from https://pypi.org/pypi/remi/json
-sha256  c8691f007dc30b91013131b6aded3521c17ef8ec9fdd152a0ad481b8cb793f14  remi-2021.3.2.tar.gz
+sha256  542df88e174bbd58fe763c49e5c2116f2c8413c1a934731069ed8c17bb9cd64c  remi-2022.7.27.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 609e127cf0..7e43c09b00 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2021.3.2
+PYTHON_REMI_VERSION = 2022.7.27
 PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/c0/99/94bd825cf8baee369b959f76c802a51ccc69d4d62ec113e26db4835f710c
+PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f4ca0bc2f387ca19f8ba9979dcb75617d094e575dc2337
+
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_SETUP_TYPE = setuptools
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
