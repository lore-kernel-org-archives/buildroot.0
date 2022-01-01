Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A0CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62630400D9;
	Sat,  1 Jan 2022 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6VQyyJB4uvN; Sat,  1 Jan 2022 09:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2123A404BB;
	Sat,  1 Jan 2022 09:55:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 583CC1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA3F81438
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osZkBXBH1osf for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8815B81397
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:54:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7564D813B8; Sat,  1 Jan 2022 09:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 10:50:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6d2ad9b359c8fe786efb0f6d224fc203d46b94b
X-Git-Newrev: bfb1265750e8e3ecef4aff2e3aa0762b8e9ae2b8
X-Patchwork-Hint: ignore
Message-Id: <20220101094828.7564D813B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-remotes: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb1265750e8e3ecef4aff2e3aa0762b8e9ae2b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-aiohttp-remotes/python-aiohttp-remotes.hash | 4 ++--
 package/python-aiohttp-remotes/python-aiohttp-remotes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index a9a6cad2df..595340d5d8 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5  e90fad4b7aa088207f831698fddd9eea  aiohttp_remotes-1.0.0.tar.gz
-sha256  caec1681de70bac82daa676078d9b125758fb3952fdaa893a6b42bdd995562ef  aiohttp_remotes-1.0.0.tar.gz
+md5  da13880f25ec3b9cf98c7baff92835a2  aiohttp_remotes-1.1.0.tar.gz
+sha256  e44f2c5fd5fc3305477c89bb25f14570589100cc58c48b36745d4239839d3174  aiohttp_remotes-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index f04cecd89d..e2bc3e1c18 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 1.0.0
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.1.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/40/b6/1178bd1e26e88f9f29b7d1bbfae7b38d39ec9cf787d4685f83ade2e7aa7f
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/e3/fc/5523010172e2d8685a8934fbb49d564118c9ebc1e4233a62b77310f979db
 PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
