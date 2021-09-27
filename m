Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92906C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6231C60FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6231C60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F43C81854;
	Mon, 27 Sep 2021 14:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJYxgl3rOKgx; Mon, 27 Sep 2021 14:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F678177A;
	Mon, 27 Sep 2021 14:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0BE1BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58C5E6084D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnK5Y7eqBfok for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2C7B60898
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 841288D267; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46164280f4271786f7673e0ab72045ffe6da4e53
X-Git-Newrev: 1725e98d59517f24ce2a7693995f7ad4249aa3cb
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.841288D267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tabledata: bump to version
 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1725e98d59517f24ce2a7693995f7ad4249aa3cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tabledata/python-tabledata.hash | 4 ++--
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 5c9a538f66..3613589ae0 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  7d1ab52001d85d19d86f08a5ad8aab58  tabledata-1.1.2.tar.gz
-sha256  db893596ab9066e5c4f002ae0fed70657e3b75cceb52dd1de5a0e145e338d830  tabledata-1.1.2.tar.gz
+md5  1874cb0bf69cbc824a7bec67431023a9  tabledata-1.3.0.tar.gz
+sha256  54541b0c9e58f8fa38251ea0a60965dbaf95737027fa80e6ab56f98d7e4d61e9  tabledata-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index c1503e69cb..48f544b115 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.1.2
+PYTHON_TABLEDATA_VERSION = 1.3.0
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/73/7c/67eec8e92504b8e00e5cc0053a3401bd1441eefc70cecfa4427bfcf76b89
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/ed/ed/dd0d6975963967492ac2c230107587593c7bd94acfa802b0c60a5395125c
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
