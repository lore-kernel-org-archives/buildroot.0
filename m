Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FF6C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49C761371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C49C761371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36F140765;
	Tue,  5 Oct 2021 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAHu4GK-HvPd; Tue,  5 Oct 2021 19:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B961405C4;
	Tue,  5 Oct 2021 19:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2A41BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F8FB407BE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAwhek7sgYrR for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7460F407C1
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2CAF291216; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89120fb5c48a3931471259c9dbf43e599ed9280
X-Git-Newrev: 54790b134283f012d2491ebd7cea21e367aadf8f
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.2CAF291216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-html5lib: bump to version
 1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=54790b134283f012d2491ebd7cea21e367aadf8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-html5lib/python-html5lib.hash | 6 +++---
 package/python-html5lib/python-html5lib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
index 04c64c10c1..5023f5ab66 100644
--- a/package/python-html5lib/python-html5lib.hash
+++ b/package/python-html5lib/python-html5lib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/html5lib/json
-md5	942a0688d6bdf20d087c9805c40182ad  html5lib-1.0.1.tar.gz
-sha256	66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736  html5lib-1.0.1.tar.gz
+md5  6748742e2ec4cb99287a6bc82bcfe2b0  html5lib-1.1.tar.gz
+sha256  b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f  html5lib-1.1.tar.gz
 # Locally computed sha256 checksums
-sha256	16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
+sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 1d6aef1aad..84229eabd0 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTML5LIB_VERSION = 1.0.1
+PYTHON_HTML5LIB_VERSION = 1.1
 PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f
+PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
