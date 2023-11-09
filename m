Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE429C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 710B14193A;
	Thu,  9 Nov 2023 21:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710B14193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56NOFwG7Liqw; Thu,  9 Nov 2023 21:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 275F04192C;
	Thu,  9 Nov 2023 21:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 275F04192C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6101BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFF360F1B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFF360F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NnyYWKmKYKj for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF316149D
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF316149D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1788786E95; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 21:58:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85b803fafac4eab7a6627cd3512cce5116bbb9df
X-Git-Newrev: 0a073da1d144007f99cea4fc99780150eca7fa0d
X-Patchwork-Hint: ignore
Message-Id: <20231109210543.1788786E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-netaddr: bump to version
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a073da1d144007f99cea4fc99780150eca7fa0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-netaddr/python-netaddr.hash | 8 ++++----
 package/python-netaddr/python-netaddr.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index d55390aad3..04dc9797f6 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/netaddr/json
-md5  34cad578473b66ad77bc3b2a7613ed4a  netaddr-0.8.0.tar.gz
-# Locally computed
-sha256  d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2b5a243  netaddr-0.8.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/netaddr/json
+md5  0c89e96501370d2538ecadca372e55a9  netaddr-0.9.0.tar.gz
+sha256  7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f08baf5f1194da0128  netaddr-0.9.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index e3ffe4e85b..1f78f04210 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.8.0
+PYTHON_NETADDR_VERSION = 0.9.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://pypi.python.org/packages/c3/3b/fe5bda7a3e927d9008c897cf1a0858a9ba9924a6b4750ec1824c9e617587
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/48/4c/2491bfdb868c3f40d985037fa64a3903c125f45d7d3025640e05715db7a3
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
 PYTHON_NETADDR_LICENSE_FILES = LICENSE
 PYTHON_NETADDR_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
