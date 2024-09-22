Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8454BCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F861813F1;
	Sun, 22 Sep 2024 10:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OufQUMUtJcuz; Sun, 22 Sep 2024 10:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D04281443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D04281443;
	Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DFF41BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C4E840631
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-Z0hg15f-10 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F27640630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F27640630
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67BE883AD3; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:31:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99b1685fd8db8e63c37edac4e544f62ead245b90
X-Git-Newrev: a8f36640f638eb2468e13d0e10b81a2bcf3f7b64
X-Patchwork-Hint: ignore
Message-Id: <20240922103436.67BE883AD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-netaddr: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8f36640f638eb2468e13d0e10b81a2bcf3f7b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting changes:
https://github.com/netaddr/netaddr/commit/2a407439ea0c759e7c44d27750e2aa3834915e25

License renamed afterwards:
https://github.com/netaddr/netaddr/commit/e3de33de5335ce8c66cf095f9543961f35f73653

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-netaddr/python-netaddr.hash | 6 +++---
 package/python-netaddr/python-netaddr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index f969aeecfc..1ad35966bb 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netaddr/json
-md5  c0d7b080da18c851ea436389813d7652  netaddr-0.10.1.tar.gz
-sha256  f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf  netaddr-0.10.1.tar.gz
+md5  b0307617f8f3aa73bbcfadac52d91df7  netaddr-1.3.0.tar.gz
+sha256  5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a  netaddr-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
+sha256  36dcdc429f76107d1697396ca0d8c43b343808c98beacb3405f472a76b65bffa  LICENSE.rst
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 79e55a739f..7c26b16bb4 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.10.1
+PYTHON_NETADDR_VERSION = 1.3.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/af/96/f4878091248450bbdebfbd01bf1d95821bd47eb38e756815a0431baa6b07
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
-PYTHON_NETADDR_LICENSE_FILES = LICENSE
+PYTHON_NETADDR_LICENSE_FILES = LICENSE.rst
 PYTHON_NETADDR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
