Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6008DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:55:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F265611F2
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F265611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B1160B50;
	Fri, 10 Sep 2021 18:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RtHIGxVJo20; Fri, 10 Sep 2021 18:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0F760718;
	Fri, 10 Sep 2021 18:55:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFA91BF424
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E78C402BB
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4EomrWu0TzP for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 18:55:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 307BE401D0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 18:55:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (4)
Received: from zm.localdomain (pub-198.183.29.194.multiplay.pl
 [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 0AAB81C56F9;
 Fri, 10 Sep 2021 20:55:04 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 20:54:55 +0200
Message-Id: <20210910185456.2688031-3-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910185456.2688031-1-m.niestroj@grinn-global.com>
References: <20210910185456.2688031-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pluggy: bump to version 1.0.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 24e207bfad..39f172a82b 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  7f610e28b8b34487336b585a3dfb803d  pluggy-0.13.1.tar.gz
-sha256  15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0  pluggy-0.13.1.tar.gz
+md5  daa6fddfb6cd364f3c82e52098911e4b  pluggy-1.0.0.tar.gz
+sha256  4224373bacce55f955a878bf9cfa763c1e360858e330072059e10bad68531159  pluggy-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index 03cdecf4b9..59382518ed 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 0.13.1
+PYTHON_PLUGGY_VERSION = 1.0.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f8/04/7a8542bed4b16a65c2714bf76cf5a0b026157da7f75e87cc88774aa10b14
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/a1/16/db2d7de3474b6e37cbb9c008965ee63835bba517e22cdb8c35b5116b5ce1
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
