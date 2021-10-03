Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2BCC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51983617E1
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51983617E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FAD40833;
	Sun,  3 Oct 2021 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GDR2_PpXuYF; Sun,  3 Oct 2021 19:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F04741490;
	Sun,  3 Oct 2021 19:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0041BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 242C7843DB
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nFINDTTplue for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FAC2843CD
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C5AE487A5E; Sun,  3 Oct 2021 19:53:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:32:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c513d89ab0e6767bc6173b9da686e229fcae26aa
X-Git-Newrev: a07b7259277afc3629d3b72a7caeb5b405173005
X-Patchwork-Hint: ignore
Message-Id: <20211003195308.C5AE487A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-netifaces: bump to version
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a07b7259277afc3629d3b72a7caeb5b405173005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-netifaces/python-netifaces.hash | 6 +++---
 package/python-netifaces/python-netifaces.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
index f59208014b..ec8ccf623e 100644
--- a/package/python-netifaces/python-netifaces.hash
+++ b/package/python-netifaces/python-netifaces.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netifaces/json
-md5	de92cc322b4f56047c073f802ad77860  netifaces-0.10.9.tar.gz
-sha256	2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3  netifaces-0.10.9.tar.gz
+md5  3146dcb3297dd018ae5eb9a52b440419  netifaces-0.11.0.tar.gz
+sha256  043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32  netifaces-0.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
+sha256  b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 502529c008..1b1aa99568 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.10.9
+PYTHON_NETIFACES_VERSION = 0.11.0
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/0d/18/fd6e9c71a35b67a73160ec80a49da63d1eed2d2055054cc2995714949132
+PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/a6/91/86a6eac449ddfae239e93ffc1918cf33fd9bab35c04d1e963b311e347a73
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = LICENSE
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
