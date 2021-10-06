Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B13BC433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF874611C0
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF874611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F4B4087B;
	Wed,  6 Oct 2021 12:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svNGq_fmNedG; Wed,  6 Oct 2021 12:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217A740783;
	Wed,  6 Oct 2021 12:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24FDC1BF42C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F9D83033
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ELEiaCbRTgu for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50B0483004
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6447991AA4; Wed,  6 Oct 2021 12:52:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 14:34:47 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: f77a1f84abb8b32dea4ab9014dfdf08f3a18e869
X-Git-Newrev: 0a41a44cb0343f6c8e9594ada2485834a8934a47
X-Patchwork-Hint: ignore
Message-Id: <20211006125207.6447991AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/python-dateutil:
 bump to version 2.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a41a44cb0343f6c8e9594ada2485834a8934a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7bd23d3d1eefa10d2abebbcf0016ae78a17dc19f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dateutil/python-dateutil.hash | 6 +++---
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index f3dc69f272..a52fb30a0f 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5	f2a1d4b680b297b367a974664ca3a4f6  python-dateutil-2.8.1.tar.gz
-sha256	73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c  python-dateutil-2.8.1.tar.gz
+md5  5970010bb72452344df3d76a10281b65  python-dateutil-2.8.2.tar.gz
+sha256  0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86  python-dateutil-2.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
+sha256  ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 759261d2d1..b75f510bce 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.8.1
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0
+PYTHON_DATEUTIL_VERSION = 2.8.2
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
