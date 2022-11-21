Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46B2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA3F40302;
	Mon, 21 Nov 2022 21:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA3F40302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltWq71shguZY; Mon, 21 Nov 2022 21:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70B7D402ED;
	Mon, 21 Nov 2022 21:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B7D402ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E16F11BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA458403A2
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA458403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meBbEoPXxGKH for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:35:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0808140179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0808140179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA4D983FD0; Mon, 21 Nov 2022 21:35:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:34:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48d0e09024715cb2edaff5366831208ce167e7a2
X-Git-Newrev: 40921efbca705b270e2bf58f5dff57d49b2d7747
X-Patchwork-Hint: ignore
Message-Id: <20221121213556.EA4D983FD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-maturin: bump
 to version 0.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=40921efbca705b270e2bf58f5dff57d49b2d7747
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index eadf300bc2..b9936fe8bf 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  06d9d166b4a2d86f06ed09eeb362ac03728e1fbd2b852cc6a4ddc7cc75029237  maturin-0.13.7.tar.gz
+sha256  54976d46be5d1e0d94ae8fbcfb8e72212b1ec9fe9752e3d14510c17a4000efeb  maturin-0.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ffbd131ef0..ab87df3842 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.7
+PYTHON_MATURIN_VERSION = 0.14.1
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/4f/19/6f982e341612ab442f90ba1a047a4188d48473ad0d1dbfb3dffdaa20e095
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/a3/54/6bac789ab775b5ef1f07977e998cf719857e2675c3442f3f24e0399e1483
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
