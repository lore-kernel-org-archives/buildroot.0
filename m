Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66CCCD193
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9CA4150E;
	Tue, 14 Oct 2025 18:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbDrQoSqlLOp; Tue, 14 Oct 2025 18:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 210B0413AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 210B0413AE;
	Tue, 14 Oct 2025 18:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07CCD294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E093283CE5
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn_ToGjX57hM for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222EA83CE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 222EA83CE0
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EFDF870E7; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1d2870ae06690b5d27e51d0e28a336ac1ef0d99
X-Git-Newrev: dc7167dcf628d2d1e4266afae761551c79a48719
X-Patchwork-Hint: ignore
Message-Id: <20251014184551.0EFDF870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump version to
 1.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc7167dcf628d2d1e4266afae761551c79a48719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/ilanschnell/bsdiff4/blob/1.2.6/CHANGELOG.txt

Updated license hash due to copyright year bump:
https://github.com/ilanschnell/bsdiff4/commit/9eefc06cefa3aad2b2c71ddbe8ef92571cd36be1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 4b09dd132b..2ea2e83be6 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  6fae66687d99305e2bf15887c9f80cf9  bsdiff4-1.2.5.tar.gz
-sha256  cdd83f820ecb8f1ef67a4e5f0b152c61d327caf7abf35aa9a763413915b21368  bsdiff4-1.2.5.tar.gz
+md5  7150cf7e21905b47f169a27355dfb529  bsdiff4-1.2.6.tar.gz
+sha256  2ab57d01a78b39e29e5accc9cfead4130982ded9dccbc4261bd0e9c51d6b751d  bsdiff4-1.2.6.tar.gz
 # Locally computed sha256 checksums
-sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
+sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 2b48bdb646..1b10b63913 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.5
+PYTHON_BSDIFF4_VERSION = 1.2.6
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/43/49/262497fc308aa998d7431130cb8526b16aa43f2cca500d0182fb68689d99
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
