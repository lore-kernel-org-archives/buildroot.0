Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA8C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29571418D6;
	Mon,  4 Dec 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29571418D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkuCvdRixVLE; Mon,  4 Dec 2023 20:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5728641BAA;
	Mon,  4 Dec 2023 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5728641BAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 013901BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA6D541917
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6D541917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbM-VZS172JE for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED40B41743
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED40B41743
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6CA6879B8; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:24:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7d2810bc9082d168799c051a4f2e5937a9254a1
X-Git-Newrev: 0cdce6d53f744252d6799ae63894b93f7f03e2ea
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.E6CA6879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: bump to version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cdce6d53f744252d6799ae63894b93f7f03e2ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/sqlalchemy/mako/commit/272f5d8cc97aee829e3b285486f33c9c8e604c74

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a010e8d8f6..03651cf956 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  651f365616611fcd4f2702a9002e2195  Mako-1.2.4.tar.gz
-sha256  d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34  Mako-1.2.4.tar.gz
+md5  90da23903468efe9aa88dc88081579ff  Mako-1.3.0.tar.gz
+sha256  e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b  Mako-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  760f22b3e9ea4a50eb99201bd8dd118869f28108cfb64ccce6d1b305cf9ae9fa  LICENSE
+sha256  0a326e448dd22f220dd30796677ddbdf3ddaa6427a9744fea9deaa51d9d74fd9  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 313fbfcab2..1f7a0b0657 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.2.4
+PYTHON_MAKO_VERSION = 1.3.0
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/05/5f/2ba6e026d33a0e6ddc1dddf9958677f76f5f80c236bd65309d280b166d3e
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef90c6b9e7f280bf7cbd756dc2560ce76214f5cdbc4ddab5
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
