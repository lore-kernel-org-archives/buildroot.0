Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D7BCAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA808438C;
	Wed, 17 Sep 2025 16:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDk1LyRqv9EU; Wed, 17 Sep 2025 16:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF13B84376
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF13B84376;
	Wed, 17 Sep 2025 16:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17BDF279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 741C2611A1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i77ePlq6x6Rb for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F8A961194
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8A961194
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90CF585212; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34386548d3bb77e104164722ed20f5017681e83f
X-Git-Newrev: 37e0d69f543cce831efdd79a0738d2b7bf092ff2
X-Patchwork-Hint: ignore
Message-Id: <20250917164533.90CF585212@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyaml: bump to version
 25.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=37e0d69f543cce831efdd79a0738d2b7bf092ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index 29863ed502..c1029bba59 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  ce3505d0331fdfc05c98f0a514308063  pyaml-25.1.0.tar.gz
-sha256  33a93ac49218f57e020b81e280d2706cea554ac5a76445ac79add760d019c709  pyaml-25.1.0.tar.gz
+md5  b5b6dc631c2c117ba3373faecf6d72f5  pyaml-25.7.0.tar.gz
+sha256  e113a64ec16881bf2b092e2beb84b7dcf1bd98096ad17f5f14e8fb782a75d99b  pyaml-25.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index 06e3871b5a..a39f6d5568 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 25.1.0
+PYTHON_PYAML_VERSION = 25.7.0
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/f4/06/04b9c1907c13dc81729a9c6b4f42eab47baab7a8738ed5d2683eac215ad0
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/c4/01/41f63d66a801a561c9e335523516bd5f761bc43cc61f8b75918306bf2da8
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
