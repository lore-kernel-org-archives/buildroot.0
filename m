Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23F2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B230A84ABA;
	Fri, 27 May 2022 09:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbtyMnuTHKF6; Fri, 27 May 2022 09:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D22E3848FA;
	Fri, 27 May 2022 09:54:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B58261BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FFEF8468E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjfu4x21AiPF for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EADE83E6D
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 892498665F; Fri, 27 May 2022 09:42:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:49:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 282402444c0cf5467b83f61a24c3702126d565c9
X-Git-Newrev: 71592236f74768720a05e76fccac4a4a286f4693
X-Patchwork-Hint: ignore
Message-Id: <20220527094200.892498665F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-aenum:
 bump to version 3.1.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=71592236f74768720a05e76fccac4a4a286f4693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b492a2671bea67b9af033df2ae0d3aec0ba5ded1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aenum/python-aenum.hash | 4 ++--
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index d10254f9b1..40c0e55fc5 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aenum/json
-md5  6f30144abd4d156f22f8a49d81c496df  aenum-3.1.0.tar.gz
-sha256  87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a  aenum-3.1.0.tar.gz
+md5  c0b78a74cdfacc0bf0cbb42785afaed8  aenum-3.1.11.tar.gz
+sha256  aed2c273547ae72a0d5ee869719c02a643da16bf507c80958faadc7e038e3f73  aenum-3.1.11.tar.gz
 # Locally computed sha256 checksums
 sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 72eaa1db2b..9a30211bb6 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 3.1.0
+PYTHON_AENUM_VERSION = 3.1.11
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/ae/25/00b2949186e76a4c9732e33221274964fecf5c88178cbe5a14a80cfc04e8
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/63/6c/a71e18de7c651f384b328be6bccadbbd472aca62f547c1a307b9388d03ca
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
