Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596FC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4842884579;
	Sat, 19 Jul 2025 11:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFtob1DRGSEN; Sat, 19 Jul 2025 11:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A34484607
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A34484607;
	Sat, 19 Jul 2025 11:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A01A2222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86FA06142C
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 546_dLetSK49 for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05D561421
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E05D561421
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3B286714; Sat, 19 Jul 2025 11:23:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 13:17:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e818c16a31a902ec29a250f920f43c76e2d9868
X-Git-Newrev: 14d1d58e1f1d3d8ff6eb92ad3ed3a7bf99e05590
X-Patchwork-Hint: ignore
Message-Id: <20250719112358.DA3B286714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspection: bump to
 0.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=14d1d58e1f1d3d8ff6eb92ad3ed3a7bf99e05590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/pydantic/typing-inspection/releases/tag/v0.4.1

LICENSE hash changed due to copyright holder line change in:
https://github.com/pydantic/typing-inspection/commit/f3a49c37707cb0b9ddcbc16c19caa75413247319

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typing-inspection/python-typing-inspection.hash | 6 +++---
 package/python-typing-inspection/python-typing-inspection.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 2ed08c1d35..4337913725 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  694cee9b0518959cd4b2b7ce2dc5cf2e  typing_inspection-0.4.0.tar.gz
-sha256  9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122  typing_inspection-0.4.0.tar.gz
+md5  d451e03d8eac368f7af674f95db586f0  typing_inspection-0.4.1.tar.gz
+sha256  6ae134cc0203c33377d43188d4064e9b357dba58cff3185f22924610e70a9d28  typing_inspection-0.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  4e40cba793a388dd456577b8657175bbe95e4ded2970534b3c59cccc2661a708  LICENSE
+sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index 043ee12090..e7f1839525 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.0
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.1
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/82/5c/e6082df02e215b846b4b8c0b887a64d7d08ffaba30605502639d44c06b82
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/f8/b1/0c11f5058406b3af7609f121aaa6b609744687f1d158b3c3a5bf4cc94238
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
