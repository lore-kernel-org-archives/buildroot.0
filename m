Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F7DC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 15:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95BF78128E;
	Sun, 13 Jul 2025 15:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxK__xbcmzvX; Sun, 13 Jul 2025 15:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4F680D2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4F680D2C;
	Sun, 13 Jul 2025 15:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAD2DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2B7408FE
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNxBORol1RXd for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 15:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412B440881
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412B440881
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 15:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C50C8649A; Sun, 13 Jul 2025 15:48:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 17:35:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3721a73a89d03553b1b2a608c7ca993873ac15dd
X-Git-Newrev: 557692a05f752d2881f3312d6e24c82e5eeaae22
X-Patchwork-Hint: ignore
Message-Id: <20250713154856.1C50C8649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 4.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=557692a05f752d2881f3312d6e24c82e5eeaae22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for changelog.

[1] https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-4140-june-2-2025

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typing-extensions/python-typing-extensions.hash | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index bd75b95e8a..1d38e3491a 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  58226788d248cee8d6283ee616543975  typing_extensions-4.13.2.tar.gz
-sha256  e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef  typing_extensions-4.13.2.tar.gz
+md5  06244b2d61784c4d1d85900927514f36  typing_extensions-4.14.0.tar.gz
+sha256  8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4  typing_extensions-4.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index f248b13d53..1ad8d210a5 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.13.2
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.14.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/f6/37/23083fcd6e35492953e8d2aaaa68b860eb422b34627b13f2ce3eb6106061
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/d1/bc/51647cd02527e87d05cb083ccc402f93e441606ff1f01739a62c8ad09ba5
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
