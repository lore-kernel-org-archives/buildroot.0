Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5A9C71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 346BA60748;
	Sun, 15 Jun 2025 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBrd9SKqwA3F; Sun, 15 Jun 2025 21:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6908860685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6908860685;
	Sun, 15 Jun 2025 21:06:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4A5151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4494018A
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_I5t2rucXlt for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 21:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C944004A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88C944004A
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 21:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82BA783B28; Sun, 15 Jun 2025 21:06:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 22:54:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68c8ff2c9521be62681e2a9ead9dccc8d7106d04
X-Git-Newrev: 917ed944ed1e4d35c9e1d10735d61225c0400048
X-Patchwork-Hint: ignore
Message-Id: <20250615210604.82BA783B28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yamllint: bump version to
 1.37.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=917ed944ed1e4d35c9e1d10735d61225c0400048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog:
https://github.com/adrienverge/yamllint/blob/master/CHANGELOG.rst#1371-2025-05-04

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-yamllint/python-yamllint.hash | 2 +-
 package/python-yamllint/python-yamllint.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
index d80e0fdf42..3287d4f2b2 100644
--- a/package/python-yamllint/python-yamllint.hash
+++ b/package/python-yamllint/python-yamllint.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
+sha256  81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d  yamllint-1.37.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index 29344a1408..835ee2ffb2 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YAMLLINT_VERSION = 1.35.1
+PYTHON_YAMLLINT_VERSION = 1.37.1
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
-PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/46/f2/cd8b7584a48ee83f0bc94f8a32fea38734cefcdc6f7324c4d3bfc699457b
 PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
