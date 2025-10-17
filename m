Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F5CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F8480886;
	Fri, 17 Oct 2025 16:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akUuVZ4RWfhk; Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6935180890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6935180890;
	Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E4ECD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3E5340B92
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koj-htPyjj0r for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3254840B85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3254840B85
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29EE387409; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d0251c9d57cff04dbd43b2cb4aa0876e7978d03
X-Git-Newrev: 58f391ee6b75c86ef5986d2de6d400617b60241c
X-Patchwork-Hint: ignore
Message-Id: <20251017163855.29EE387409@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspection: bump to
 0.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=58f391ee6b75c86ef5986d2de6d400617b60241c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/pydantic/typing-inspection/blob/main/HISTORY.md#v042-2025-10-01

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typing-inspection/python-typing-inspection.hash | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 4337913725..71ee5943a8 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  d451e03d8eac368f7af674f95db586f0  typing_inspection-0.4.1.tar.gz
-sha256  6ae134cc0203c33377d43188d4064e9b357dba58cff3185f22924610e70a9d28  typing_inspection-0.4.1.tar.gz
+md5  9271faadd8476a3600e9cf9d428d812c  typing_inspection-0.4.2.tar.gz
+sha256  ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464  typing_inspection-0.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index e7f1839525..c0af54056d 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.1
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.2
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/f8/b1/0c11f5058406b3af7609f121aaa6b609744687f1d158b3c3a5bf4cc94238
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
