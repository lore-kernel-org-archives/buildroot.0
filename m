Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDCDC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFFEA607D5;
	Fri,  1 Mar 2024 08:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QArre_zwwCw1; Fri,  1 Mar 2024 08:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B726081D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B726081D;
	Fri,  1 Mar 2024 08:35:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 258DF1BF98E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15A48144E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hS_e0ZNS7KPQ for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B6781452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B6781452
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DD7287E77; Fri,  1 Mar 2024 08:35:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:26:54 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 12b031823452f965338f691a81ac28536f18e87c
X-Git-Newrev: 83012c801369d7e0d6ae3aa15598d6fd22e83596
X-Patchwork-Hint: ignore
Message-Id: <20240301083511.9DD7287E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-lmdb: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=83012c801369d7e0d6ae3aa15598d6fd22e83596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:py-lmdb_project:py-lmdb is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/AFE6D0BA-D905-43F6-81FE-308D591A82B8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5d496d7a215af398e9708cfd8d1f458b8b92dbfe)
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
