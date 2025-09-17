Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AFACAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6BC61324;
	Wed, 17 Sep 2025 16:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0Q781MFBDv6; Wed, 17 Sep 2025 16:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEA46160C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEA46160C;
	Wed, 17 Sep 2025 16:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D22F199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 696D561544
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHvglz97zXOT for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAAED611D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAAED611D9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7D9F851CA; Wed, 17 Sep 2025 16:45:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a54553b857b30d1d7c6e5ba28d17f57983182a2
X-Git-Newrev: a5c151f70df71b1946dbb23f44b3cc5c249eaa50
X-Patchwork-Hint: ignore
Message-Id: <20250917164533.C7D9F851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-qrcode: bump to version 8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5c151f70df71b1946dbb23f44b3cc5c249eaa50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-qrcode/python-qrcode.hash | 4 ++--
 package/python-qrcode/python-qrcode.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index 549e077c2b..21076091d7 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/qrcode/json
-md5  71039efd5939238780bcd6861bf0bc50  qrcode-8.1.tar.gz
-sha256  e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48  qrcode-8.1.tar.gz
+md5  c1dd482e98405aa0aaf4d5cf5685f57a  qrcode-8.2.tar.gz
+sha256  35c3f2a4172b33136ab9f6b3ef1c00260dd2f66f858f24d88418a015f446506c  qrcode-8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index f50d49704f..72c54b5339 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 8.1
+PYTHON_QRCODE_VERSION = 8.2
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/61/d4/d222d00f65c81945b55e8f64011c33cb11a2931957ba3e2845fb0874fffe
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/8f/b2/7fc2931bfae0af02d5f53b174e9cf701adbb35f39d69c2af63d4a39f81a9
 PYTHON_QRCODE_SETUP_TYPE = poetry
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
