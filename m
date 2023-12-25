Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B79C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B88D40647;
	Mon, 25 Dec 2023 20:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B88D40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGxFaGU-MYFq; Mon, 25 Dec 2023 20:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8407340528;
	Mon, 25 Dec 2023 20:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8407340528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E78A1BF228
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1654093C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1654093C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyDUHRIoRufM for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D27740939
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D27740939
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEAD4831FC; Mon, 25 Dec 2023 20:42:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:29:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 442b2af2d4920f1cc0cfc4438a78898cc324e640
X-Git-Newrev: 02fddb29abba52fd00aa66cf8608f008b71533b3
X-Patchwork-Hint: ignore
Message-Id: <20231225204211.DEAD4831FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 version 4.9.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02fddb29abba52fd00aa66cf8608f008b71533b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-extensions/python-typing-extensions.hash | 6 +++---
 package/python-typing-extensions/python-typing-extensions.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index fedb9e0446..778b2d5771 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  06e7fff4b1d51f8dc6f49b16e71de54e  typing_extensions-4.7.1.tar.gz
-sha256  b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2  typing_extensions-4.7.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typing-extensions/json
+md5  2bcafbd6817cb0d7a29ed7a7f1bb1e5d  typing_extensions-4.9.0.tar.gz
+sha256  23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783  typing_extensions-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 9d41b0a6a5..89ed75bda7 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.7.1
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.9.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/3c/8b/0111dd7d6c1478bf83baa1cab85c686426c7a6274119aceb2bd9d35395ad
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/0c/1d/eb26f5e75100d531d7399ae800814b069bc2ed2a7410834d57374d010d96
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
