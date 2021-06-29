Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473BDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:52:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A806603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A806603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB496404C2;
	Tue,  3 Aug 2021 21:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOeRZgpQwUyC; Tue,  3 Aug 2021 21:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A71A8404C1;
	Tue,  3 Aug 2021 21:52:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD561BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39BA4048C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oW_DdYW15-7z for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2383640235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E3BB82926; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:40:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4684efabbc7ffab04d14d0db94e24e56ab054cd9
X-Git-Newrev: d61bf0f90ef651eb486ef69054f129bb0c41a54f
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.6E3BB82926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cheetah: Bump
 version to 3.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d61bf0f90ef651eb486ef69054f129bb0c41a54f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cheetah/python-cheetah.hash | 4 ++--
 package/python-cheetah/python-cheetah.mk   | 4 ++--
 package/python3-cheetah/python3-cheetah.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cheetah/python-cheetah.hash b/package/python-cheetah/python-cheetah.hash
index 286b41fd9e..f7094a8bb1 100644
--- a/package/python-cheetah/python-cheetah.hash
+++ b/package/python-cheetah/python-cheetah.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/pypi/Cheetah3/json
-md5  8c0ac643263ffc3454fb321342284d0a  Cheetah3-3.2.4.tar.gz
-sha256	caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b  Cheetah3-3.2.4.tar.gz
+md5  42bb9da785974c7e4089aa754ff99a73  Cheetah3-3.2.6.post2.tar.gz
+sha256	63157d7a00a273b59676b5be5aa817c75c37efc88478231f1a160f4cfb7f7878  Cheetah3-3.2.6.post2.tar.gz
 # Locally computed sha256 checksums
 sha256  635349ae512fafc2e60eb74a50d0a5276fa06c00b5ecb20da53546449ddc45ea  LICENSE
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 3dfd1fc54a..02877e03c4 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cheetah/python3-cheetah.mk
-PYTHON_CHEETAH_VERSION = 3.2.4
+PYTHON_CHEETAH_VERSION = 3.2.6.post2
 PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
-PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
+PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
 PYTHON_CHEETAH_LICENSE = MIT
 PYTHON_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON_CHEETAH_SETUP_TYPE = setuptools
diff --git a/package/python3-cheetah/python3-cheetah.mk b/package/python3-cheetah/python3-cheetah.mk
index 8876f8d735..93d16201aa 100644
--- a/package/python3-cheetah/python3-cheetah.mk
+++ b/package/python3-cheetah/python3-cheetah.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-cheetah/python-cheetah.mk
-PYTHON3_CHEETAH_VERSION = 3.2.4
+PYTHON3_CHEETAH_VERSION = 3.2.6.post2
 PYTHON3_CHEETAH_SOURCE = Cheetah3-$(PYTHON3_CHEETAH_VERSION).tar.gz
-PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/4e/72/e6a7d92279e3551db1b68fd336fd7a6e3d2f2ec742bf486486e6150d77d2
+PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
 PYTHON3_CHEETAH_LICENSE = MIT
 PYTHON3_CHEETAH_LICENSE_FILES = LICENSE
 PYTHON3_CHEETAH_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
