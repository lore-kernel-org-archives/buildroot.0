Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27043C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F496103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1F496103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF4B480F2C;
	Mon, 25 Oct 2021 19:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_hA5ERmbVfV; Mon, 25 Oct 2021 19:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BDE80D6E;
	Mon, 25 Oct 2021 19:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 593921BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 484F180D6E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnVO4CCyTUPQ for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 920F480D3A
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0BF68887EA; Mon, 25 Oct 2021 19:13:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59bc401fa4af5664cc84e172c39467030710051f
X-Git-Newrev: 8db775229b033f25661433fbc7c59d66ec2798b7
X-Patchwork-Hint: ignore
Message-Id: <20211025191322.0BF68887EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txtorcon: bump to version
 21.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8db775229b033f25661433fbc7c59d66ec2798b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 803933f1e6..af542c7f2e 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5	fb323f9874298a8145dbe8d43c387932  txtorcon-19.1.0.tar.gz
-sha256	25d8e52c3eac45bb90ff958ca7cdd7674fb3284e3a50826a58ab7b9578b15ea5  txtorcon-19.1.0.tar.gz
+md5  dbb53821a3ce3e921e09c5de4f722fdb  txtorcon-21.1.0.tar.gz
+sha256  aebf0b9ec6c69a029f6b61fd534e785692e28fdcd2fd003ce3cc132b9393b7d6  txtorcon-21.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 4df400c3e7..b8414d96d0 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 19.1.0
+PYTHON_TXTORCON_VERSION = 21.1.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/8c/26/d5b2fba4ffbcb23957ff2cee4d7d0a2d667372b9eb04807058bd561c8e8f
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/eb/43/2426009377cef519c53bdc8969590cb100e9fd745846859963c881c6d176
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
