Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85530C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4A761105;
	Tue, 25 Jul 2023 20:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE4A761105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqpkgQoIkOgT; Tue, 25 Jul 2023 20:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2342161117;
	Tue, 25 Jul 2023 20:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2342161117
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED64A1BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3D2B6111B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D2B6111B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYS7gToyst2v for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E718961105
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E718961105
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D460682BA2; Tue, 25 Jul 2023 20:02:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:51:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfdef9f3b0a7ae93c9b524532c23c6a66cd8faa2
X-Git-Newrev: b6b39dddf4a8c77b9d9093c90e819e6bdc16d3a4
X-Patchwork-Hint: ignore
Message-Id: <20230725200232.D460682BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 23.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6b39dddf4a8c77b9d9093c90e819e6bdc16d3a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 4fa7c451f5..11448fef3a 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  55cd275bc3d9c7e354f4b6a87b87f466  autobahn-23.1.2.tar.gz
-sha256  c5ef8ca7422015a1af774a883b8aef73d4954c9fcd182c9b5244e08e973f7c3a  autobahn-23.1.2.tar.gz
+md5  f29d3cebec06c81a87823a2776ffcc5c  autobahn-23.6.2.tar.gz
+sha256  ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181  autobahn-23.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index c44acb80aa..703f106515 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 23.1.2
+PYTHON_AUTOBAHN_VERSION = 23.6.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/53/99/b6e0ffa0e8bafe9dfae1c9ab46d44d07317cbf297fbf8f07aff8a80e5bd8
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/92/ee/c3320c326919394ff597592549ff5d29d2f7bf12be9ddaa9017caff1a170
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
