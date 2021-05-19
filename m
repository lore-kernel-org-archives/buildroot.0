Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4A3C4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:18:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142C460EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 142C460EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD23640476;
	Tue,  3 Aug 2021 22:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpA_km83sEZW; Tue,  3 Aug 2021 22:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D112740480;
	Tue,  3 Aug 2021 22:18:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A251BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D1B404BE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otb_LxoPvQ9d for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D54040520
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 628EE83875; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 11:42:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 50791af71fd33cc7048ae2ad85ee02fd2a227ae0
X-Git-Newrev: 4d172c8c01726c2c5a6d90977ad8fa7e77433022
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.628EE83875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-falcon: Bump to
 version 3.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d172c8c01726c2c5a6d90977ad8fa7e77433022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 80b2aed54f..979419c25a 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  0ebd5316cd7f59b9be4ea13650ea3a0d  falcon-3.0.0.tar.gz
-sha256  8d7c3d52ae4590ddfa0b3d9c75d44ab573340a5e78d72ee687712e757ac53929  falcon-3.0.0.tar.gz
+md5  4a70cfeeacb453f5fd7eb791bdd3ac01  falcon-3.0.1.tar.gz
+sha256  c41d84db325881a870e8b7129d5ecfd972fa4323cf77b7119a1d2a21966ee681  falcon-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 5b73b23277..1f400f9a1f 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.0.0
+PYTHON_FALCON_VERSION = 3.0.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/f1/59/2748d63922a46e040be06cd175a6242a33ade7839aac37f441544bb6d651
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/63/22/6a9009c53ad78e65d88a44db8eccc7f39c6f54fc05fb43b1e9cbbc481d06
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
