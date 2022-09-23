Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A7BECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA2E040A38;
	Fri, 23 Sep 2022 12:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA2E040A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KqKNztxx4Ks; Fri, 23 Sep 2022 12:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBFF940A18;
	Fri, 23 Sep 2022 12:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFF940A18
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26ABB1C2744
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03CDD83F5F
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CDD83F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fG4-85wqo2D for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:17:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED8183F33
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED8183F33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AB7E85ED7; Fri, 23 Sep 2022 12:17:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 14:16:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76a41d258a8a7509e28da3f4160b08da20759149
X-Git-Newrev: 1d6db4be811fdd1573bbd5b3f46e6916a80232a0
X-Patchwork-Hint: ignore
Message-Id: <20220923121735.0AB7E85ED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: bump to version
 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d6db4be811fdd1573bbd5b3f46e6916a80232a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 14938de9c4..3a145e0f81 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  99a01a3806cc750c242cae330429a90f  pyphen-0.12.0.tar.gz
-sha256  b7d3dfc24b6f2178cdb2b1757ace0bd5d222de3e62c28d22ac578c5f22a13e9b  pyphen-0.12.0.tar.gz
+md5  a2d6f69468684bbaa88d004b79c02128  pyphen-0.13.0.tar.gz
+sha256  06873cebffd65a8fca7c20c0e3dc032655c7ee8de0f552205cad3b574265c293  pyphen-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index ac0bcf8aab..d83eb79736 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.12.0
+PYTHON_PYPHEN_VERSION = 0.13.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/0e/21/9e0841aa76db69e2d74cd64ea2271151d7332fa627a5f03eb0d9ccf3da87
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/53/e7f212c87f91aab928bbf0de95ebc319c4d935e59bd5ed868f2c2bfc9465
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
