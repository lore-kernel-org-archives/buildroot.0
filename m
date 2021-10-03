Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19A8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F72E6124C
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F72E6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E324263F;
	Sun,  3 Oct 2021 08:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0oJYT1opikw; Sun,  3 Oct 2021 08:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83501406CF;
	Sun,  3 Oct 2021 08:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D041BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F2640560
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7ZzeiL6zRYJ for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF2A400F3
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 15E9B8DB53; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e3e94d45ef331ce08b1a125ee44820a1896dd51
X-Git-Newrev: b25dd5eb96ce54c96df7911f6e646428cbe4e221
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.15E9B8DB53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-request-id: bump to version
 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b25dd5eb96ce54c96df7911f6e646428cbe4e221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-request-id/python-request-id.hash | 6 +++---
 package/python-request-id/python-request-id.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-request-id/python-request-id.hash b/package/python-request-id/python-request-id.hash
index ecf9d6508d..a0e59a3260 100644
--- a/package/python-request-id/python-request-id.hash
+++ b/package/python-request-id/python-request-id.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/request-id/json
-md5	81d6159edc745384181cb97f045c51b4  request-id-1.0.tar.gz
-sha256	4928002c8e4c767f3f8319194c9f3080ff98f14cabf44c0674a81ee58ec20fc4  request-id-1.0.tar.gz
+md5  abf0125561fb38198893ba4b46c5ce28  request-id-1.0.1.tar.gz
+sha256  4adf1dc880085571454667ee4dba36a12b720eea5dbbfbbbd840c5a24268b4f7  request-id-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
+sha256  2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
diff --git a/package/python-request-id/python-request-id.mk b/package/python-request-id/python-request-id.mk
index 4812e53c72..8fe8dc04fb 100644
--- a/package/python-request-id/python-request-id.mk
+++ b/package/python-request-id/python-request-id.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUEST_ID_VERSION = 1.0
+PYTHON_REQUEST_ID_VERSION = 1.0.1
 PYTHON_REQUEST_ID_SOURCE = request-id-$(PYTHON_REQUEST_ID_VERSION).tar.gz
-PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/bc/b6/ade909d4af3dffe492789d36ea58a0ecbd637f8200bc480b282d455fe497
+PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/9b/b3/30617b85b1766b6a804f2b8abc0ca7496f6349236f7eec28cb42687ca8e3
 PYTHON_REQUEST_ID_SETUP_TYPE = setuptools
 PYTHON_REQUEST_ID_LICENSE = MIT
 PYTHON_REQUEST_ID_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
