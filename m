Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FA5C4320A
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB36661038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB36661038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8212F83B36;
	Fri, 13 Aug 2021 13:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgJ3jxzinbKg; Fri, 13 Aug 2021 13:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9341583B38;
	Fri, 13 Aug 2021 13:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14F9B1C115D
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB36683AEF
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yGT2cobnaAt for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B1BF83B0A
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:13:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 98A89878CD; Fri, 13 Aug 2021 13:13:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:13:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24780dbad44f0720edc82fccae83357e0f43b882
X-Git-Newrev: d1e863f893a176691bf40ae8298515f8c3fb22c0
X-Patchwork-Hint: ignore
Message-Id: <20210813131315.98A89878CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dbus-next: bump
 to version 0.2.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d1e863f893a176691bf40ae8298515f8c3fb22c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dbus-next/python-dbus-next.hash | 4 ++--
 package/python-dbus-next/python-dbus-next.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-next/python-dbus-next.hash b/package/python-dbus-next/python-dbus-next.hash
index fa1cbc9da7..57bfaaf547 100644
--- a/package/python-dbus-next/python-dbus-next.hash
+++ b/package/python-dbus-next/python-dbus-next.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-next/json
-md5  fcf7443b379ef69f95727bec0221ebc9  dbus_next-0.2.2.tar.gz
-sha256  f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de  dbus_next-0.2.2.tar.gz
+md5  0e31605bd90f3460aebcd0bb7fe0dc20  dbus_next-0.2.3.tar.gz
+sha256  f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5  dbus_next-0.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c454ab6b8e0653a8eab828a8cbaaa368a1bbfba982178bb18b6177e311eae4cc  LICENSE
diff --git a/package/python-dbus-next/python-dbus-next.mk b/package/python-dbus-next/python-dbus-next.mk
index 9aab9ac92b..f35a32cb3a 100644
--- a/package/python-dbus-next/python-dbus-next.mk
+++ b/package/python-dbus-next/python-dbus-next.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_NEXT_VERSION = 0.2.2
+PYTHON_DBUS_NEXT_VERSION = 0.2.3
 PYTHON_DBUS_NEXT_SOURCE = dbus_next-$(PYTHON_DBUS_NEXT_VERSION).tar.gz
-PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/cb/fb/5ab0485c6460e39be75e16af95c0e23c2531c1ac5a482fffb9ee7d576e6f
+PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/ce/45/6a40fbe886d60a8c26f480e7d12535502b5ba123814b3b9a0b002ebca198
 PYTHON_DBUS_NEXT_SETUP_TYPE = setuptools
 PYTHON_DBUS_NEXT_LICENSE = MIT
 PYTHON_DBUS_NEXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
