Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BF9C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 09:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6809760A54;
	Mon, 14 Jul 2025 09:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqeZqt1Q88pL; Mon, 14 Jul 2025 09:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B19E610DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B19E610DF;
	Mon, 14 Jul 2025 09:46:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78528DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 753A56085F
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kSWfNJTsE50 for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A350460A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A350460A54
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B8D9864EE; Mon, 14 Jul 2025 09:46:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 11:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 557692a05f752d2881f3312d6e24c82e5eeaae22
X-Git-Newrev: 9189e74ef87af5b26fe94cac8096b4883ace8f99
X-Patchwork-Hint: ignore
Message-Id: <20250714094627.9B8D9864EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 4.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9189e74ef87af5b26fe94cac8096b4883ace8f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/python/typing_extensions/releases/tag/4.14.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typing-extensions/python-typing-extensions.hash | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index 1d38e3491a..c422691dab 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  06244b2d61784c4d1d85900927514f36  typing_extensions-4.14.0.tar.gz
-sha256  8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4  typing_extensions-4.14.0.tar.gz
+md5  da52c877660b1760771ce7553f729c5d  typing_extensions-4.14.1.tar.gz
+sha256  38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36  typing_extensions-4.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 1ad8d210a5..9ed8b71ff2 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.14.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.14.1
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/d1/bc/51647cd02527e87d05cb083ccc402f93e441606ff1f01739a62c8ad09ba5
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/5a/da40306b885cc8c09109dc2e1abd358d5684b1425678151cdaed4731c822
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
