Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04D1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDCD610A1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FDCD610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3FD83FB1;
	Wed,  6 Oct 2021 12:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9tf5iXjllJa; Wed,  6 Oct 2021 12:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 938C283FAF;
	Wed,  6 Oct 2021 12:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C68D1BF42C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F624040D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8cIGYotvCB7 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33245400C9
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 44FE592168; Wed,  6 Oct 2021 12:52:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 14:00:31 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0cf58a8d0a8024e0c4bdb0f30bcc8446f9a18478
X-Git-Newrev: 92d0a70863e72b97d22169ae4ed7fbbdbd31b03b
X-Patchwork-Hint: ignore
Message-Id: <20211006125207.44FE592168@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/python-webob:
 bump to version 1.8.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=92d0a70863e72b97d22169ae4ed7fbbdbd31b03b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 548750a257381af6f59da45daa10c77cafe11461)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index aab2f1d9e4..a46c1dbc94 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  dc3cc8c317d4acd03a6fd97cb0a9121a  WebOb-1.8.6.tar.gz
-sha256  aa3a917ed752ba3e0b242234b2a373f9c4e2a75d35291dcbe977649bd21fd108  WebOb-1.8.6.tar.gz
+md5  10191c69fa5a2c00f3b9abfb8937b415  WebOb-1.8.7.tar.gz
+sha256  b64ef5141be559cfade448f044fa45c2260351edcb6a8ef6b7e00c7dcef0c323  WebOb-1.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 051c117538..11ba104476 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.6
+PYTHON_WEBOB_VERSION = 1.8.7
 PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/2a/32/5f3f43d0784bdd9392db0cb98434d7cd23a0d8a420c4d243ad4cb8517f2a
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/c7/45/ee5f034fb4ebe3236fa49e5a4fcbc54444dd22ecf33079cf56f9606d479d
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
