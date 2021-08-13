Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D87C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:32:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A430760F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A430760F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9F36077D;
	Sat,  4 Sep 2021 18:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDkrdeuB0n1q; Sat,  4 Sep 2021 18:32:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860636078D;
	Sat,  4 Sep 2021 18:32:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 749331BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20F7B60764
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fs_iTW4jgUXj for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2403A6073A
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E1BE58834D; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:13:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24780dbad44f0720edc82fccae83357e0f43b882
X-Git-Newrev: d1e863f893a176691bf40ae8298515f8c3fb22c0
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.E1BE58834D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-next: bump to version
 0.2.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1e863f893a176691bf40ae8298515f8c3fb22c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
