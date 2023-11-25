Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC0C61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C1B402F2;
	Sat, 25 Nov 2023 11:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93C1B402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tD7XOXzr10mf; Sat, 25 Nov 2023 11:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C428402F4;
	Sat, 25 Nov 2023 11:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C428402F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24F7A1BF863
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54AE540220
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AE540220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja9kOec9tof0 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 362D440160
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 362D440160
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2170486C58; Sat, 25 Nov 2023 11:31:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:24:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0cdce6d53f744252d6799ae63894b93f7f03e2ea
X-Git-Newrev: 134e65f023d6a9e28ceea595fe5e7c66f58837ca
X-Patchwork-Hint: ignore
Message-Id: <20231125113128.2170486C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-outcome: bump
 to version 1.3.0.post0
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

commit: https://git.buildroot.net/buildroot/commit/?id=134e65f023d6a9e28ceea595fe5e7c66f58837ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-outcome/python-outcome.hash | 4 ++--
 package/python-outcome/python-outcome.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-outcome/python-outcome.hash b/package/python-outcome/python-outcome.hash
index 43796e89ac..476da60766 100644
--- a/package/python-outcome/python-outcome.hash
+++ b/package/python-outcome/python-outcome.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/outcome/json
-md5  58612ee4407901985f85ad3869dd83b8  outcome-1.2.0.tar.gz
-sha256  6f82bd3de45da303cf1f771ecafa1633750a358436a8bb60e06a1ceb745d2672  outcome-1.2.0.tar.gz
+md5  3a626832ac864c95f6054958d0da3011  outcome-1.3.0.post0.tar.gz
+sha256  9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8  outcome-1.3.0.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
index 27d7fdede3..aa8a6cbf38 100644
--- a/package/python-outcome/python-outcome.mk
+++ b/package/python-outcome/python-outcome.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OUTCOME_VERSION = 1.2.0
+PYTHON_OUTCOME_VERSION = 1.3.0.post0
 PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
-PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/dd/91/741e1626e89fdc3664169e16300c59eefa4b23540cc6d6c70450f885098f
+PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/98/df/77698abfac98571e65ffeb0c1fba8ffd692ab8458d617a0eed7d9a8d38f2
 PYTHON_OUTCOME_SETUP_TYPE = setuptools
 PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
 PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
