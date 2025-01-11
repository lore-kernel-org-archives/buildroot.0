Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE5BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB7A80FAF;
	Fri, 28 Feb 2025 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6o6slsCASh_Y; Fri, 28 Feb 2025 16:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 668A484E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668A484E14;
	Fri, 28 Feb 2025 16:55:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F9B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCAC424E5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz4bh_44jAAm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1957541954
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1957541954
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1539087A8B; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 19:03:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3a9cd1bdef0efe6feef5d9c9c155fb48a201e8f7
X-Git-Newrev: 2000d973b3b6826ebc58d086d01e5134899a5ae9
X-Patchwork-Hint: ignore
Message-Id: <20250228163006.1539087A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pytablewriter:
 bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2000d973b3b6826ebc58d086d01e5134899a5ae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/thombashi/pytablewriter/commit/66d421e4750e7eb65b8f2bb8c9481c342d84c892

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytablewriter/python-pytablewriter.hash | 6 +++---
 package/python-pytablewriter/python-pytablewriter.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index d4432ee121..82185edb37 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  4e3d421d026f30fadec4ac1670e524ee  pytablewriter-1.2.0.tar.gz
-sha256  0204a4bb684a22140d640f2599f09e137bcdc18b3dd49426f4a555016e246b46  pytablewriter-1.2.0.tar.gz
+md5  2522e6719d47f315684800d8631cfb9f  pytablewriter-1.2.1.tar.gz
+sha256  7bd0f4f397e070e3b8a34edcf1b9257ccbb18305493d8350a5dbc9957fced959  pytablewriter-1.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  130a35b917df1951aefbf366120491d5124045a87ded123f20ded21521f4e3a2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index d8bc3615dd..6c22d750a0 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 1.2.0
+PYTHON_PYTABLEWRITER_VERSION = 1.2.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/cc/a9/76aa4430d32ae10b23e4347006dc4c67a3e2a00621e4bb38a60c1a77f15e
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/f6/a1/617730f290f04d347103ab40bf67d317df6691b14746f6e1ea039fb57062
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
+PYTHON_PYTABLEWRITER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
