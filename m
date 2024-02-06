Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE27C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D3042091;
	Tue,  6 Feb 2024 22:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOv2cXSKgztn; Tue,  6 Feb 2024 22:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA3542096
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA3542096;
	Tue,  6 Feb 2024 22:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B62091BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17B383417
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXFypxUdwaX1 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECF981F5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECF981F5E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:32:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF89873F6; Tue,  6 Feb 2024 22:32:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:31:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 568bd6c39d1a28f27d6509d885e09de281953e63
X-Git-Newrev: 5d496d7a215af398e9708cfd8d1f458b8b92dbfe
X-Patchwork-Hint: ignore
Message-Id: <20240206223241.EAF89873F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d496d7a215af398e9708cfd8d1f458b8b92dbfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:py-lmdb_project:py-lmdb is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/AFE6D0BA-D905-43F6-81FE-308D591A82B8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-lmdb/python-lmdb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 52617b6ed0..7906d388ae 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -9,6 +9,8 @@ PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
 PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/de/13/dd9b0c1924f0becc93e0bacd123a4e7a347966e3e74753ace3b1e85acc39
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
+PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
