Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F8DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C744EFA6;
	Fri, 28 Feb 2025 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIq2TeWATVqv; Fri, 28 Feb 2025 16:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9134EF7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9134EF7C;
	Fri, 28 Feb 2025 16:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEDF1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E447B4252E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFrcsc-LBjpr for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FE74255A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65FE74255A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6147380FA8; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:03:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a2740f0482a1abb20fd8e46fea1c7ee52ffe095
X-Git-Newrev: b74a5a1e929dd15e01108d94db51a3a1ea74d3f6
X-Patchwork-Hint: ignore
Message-Id: <20250228163007.6147380FA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tcolorpy: bump
 to version 0.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b74a5a1e929dd15e01108d94db51a3a1ea74d3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/thombashi/tcolorpy/commit/8f71e7f6672fd77170b461e0dafcce7328cc3533

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tcolorpy/python-tcolorpy.hash | 6 +++---
 package/python-tcolorpy/python-tcolorpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tcolorpy/python-tcolorpy.hash b/package/python-tcolorpy/python-tcolorpy.hash
index 0bba6e47fe..30cdda9f69 100644
--- a/package/python-tcolorpy/python-tcolorpy.hash
+++ b/package/python-tcolorpy/python-tcolorpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tcolorpy/json
-md5  a4a8404d2b6ecfae4eeca8c71e4634c6  tcolorpy-0.1.6.tar.gz
-sha256  8cea0bf5f8cf03f77528a9acfbf312df935573892ba5ea3b2516e61fa54de9a5  tcolorpy-0.1.6.tar.gz
+md5  6232d098c4531507e2aa04fe34fb8cd3  tcolorpy-0.1.7.tar.gz
+sha256  0fbf6bf238890bbc2e32662aa25736769a29bf6d880328f310c910a327632614  tcolorpy-0.1.7.tar.gz
 # Locally computed sha256 checksums
-sha256  f41a0456d5f2bba25fd4d7e50b51a95de304770ff1db5a79515d03397a914d8d  LICENSE
+sha256  a26e357cfe6ba55f8d8e1e9d82c928ee7ed3c1ecd351b29455ca7a3f5d5a664d  LICENSE
diff --git a/package/python-tcolorpy/python-tcolorpy.mk b/package/python-tcolorpy/python-tcolorpy.mk
index bdc66f61bc..062c218ef7 100644
--- a/package/python-tcolorpy/python-tcolorpy.mk
+++ b/package/python-tcolorpy/python-tcolorpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TCOLORPY_VERSION = 0.1.6
+PYTHON_TCOLORPY_VERSION = 0.1.7
 PYTHON_TCOLORPY_SOURCE = tcolorpy-$(PYTHON_TCOLORPY_VERSION).tar.gz
-PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/af/f6/b17885354c5addfb93c14f3ed7172c33494f989dd5f83c0340d2c8fa3b69
+PYTHON_TCOLORPY_SITE = https://files.pythonhosted.org/packages/80/cc/44f2d81d8f9093aad81c3467a5bf5718d2b5f786e887b6e4adcfc17ec6b9
 PYTHON_TCOLORPY_SETUP_TYPE = setuptools
 PYTHON_TCOLORPY_LICENSE = MIT
 PYTHON_TCOLORPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
