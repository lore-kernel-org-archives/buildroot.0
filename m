Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5355AC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0309E41743;
	Mon,  5 Feb 2024 11:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0309E41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgg84GqYIljq; Mon,  5 Feb 2024 11:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0B4841766;
	Mon,  5 Feb 2024 11:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B4841766
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C16441BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ACD181E11
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ACD181E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpNaTKZxv79y for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23F82828BA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F82828BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FC3D86BBA; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:17:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83763e58de2393eac2db52af3f5ea825bf77f88f
X-Git-Newrev: 8928608c19048ac140cfc5e5f0e84d50d5d590d5
X-Patchwork-Hint: ignore
Message-Id: <20240205111738.0FC3D86BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 0.34.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8928608c19048ac140cfc5e5f0e84d50d5d590d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index a7f1f66446..820026b70b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  5193c4b7d2ea4c93635c340a7ba9b54f  starlette-0.27.0.tar.gz
-sha256  6a6b0d042acb8d469a01eba54e9cda6cbd24ac602c4cd016723117d6a7e73b75  starlette-0.27.0.tar.gz
+md5  2ef2fc635691fd4a1823564218292dce  starlette-0.34.0.tar.gz
+sha256  ed050aaf3896945bfaae93bdf337e53ef3f29115a9d9c153e402985115cd9c8e  starlette-0.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index b04b95a797..07f9d6be5e 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.27.0
+PYTHON_STARLETTE_VERSION = 0.34.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/06/68/559bed5484e746f1ab2ebbe22312f2c25ec62e4b534916d41a8c21147bf8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/4f/36/168ba6d56a28382f3b081b23b0cc431de35786e120b94c1f372708ed3059
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
