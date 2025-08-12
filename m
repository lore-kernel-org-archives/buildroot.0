Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0060CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78ED580DB2;
	Thu, 14 Aug 2025 20:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqaTOlkUqmSb; Thu, 14 Aug 2025 20:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08CA1807A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CA1807A2;
	Thu, 14 Aug 2025 20:06:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD3B1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A2360745
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxnNxVGw1_HU for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A0C160738
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A0C160738
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB6758758C; Thu, 14 Aug 2025 20:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 15:02:04 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 344fcb4cdd77087aace63f3b0cf5c634da0ebb13
X-Git-Newrev: 842e8a6a40dd18582fc402a49e42eae7f87dc656
X-Patchwork-Hint: ignore
Message-Id: <20250814200603.DB6758758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-propcache:
 bump to version 0.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=842e8a6a40dd18582fc402a49e42eae7f87dc656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 784f52b64788ab4e3686c9e20d6c17e574f2d8e0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 1bda1e96fb..6e89eac6aa 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  c642caac1415818205011277008142ea  propcache-0.2.1.tar.gz
-sha256  3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64  propcache-0.2.1.tar.gz
+md5  1c073b491620a9f6d568276d61f80277  propcache-0.3.2.tar.gz
+sha256  20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168  propcache-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 92a31a19af..e1050c4919 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.2.1
+PYTHON_PROPCACHE_VERSION = 0.3.2
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/20/c8/2a13f78d82211490855b2fb303b6721348d0787fdd9a12ac46d99d3acde1
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a6/16/43264e4a779dd8588c21a70f0709665ee8f611211bdd2c87d952cfa7c776
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
