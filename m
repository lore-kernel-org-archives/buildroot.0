Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6286E417B9;
	Thu,  9 Nov 2023 21:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6286E417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGdjZbjUV5y4; Thu,  9 Nov 2023 21:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B05E417C5;
	Thu,  9 Nov 2023 21:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B05E417C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD141BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F2C482175
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2C482175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uds_KSIKVO9n for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB18882110
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB18882110
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C985786E93; Thu,  9 Nov 2023 21:05:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 21:58:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20d6625eb1f6d807c1c6878d56a5a8d557993d15
X-Git-Newrev: 4ab85dc04e49cc33ce6f5f7df1081db3f14fa4fb
X-Patchwork-Hint: ignore
Message-Id: <20231109210542.C985786E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-modbus-tk: bump to version
 1.1.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ab85dc04e49cc33ce6f5f7df1081db3f14fa4fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-modbus-tk/python-modbus-tk.hash | 5 +++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c486e49715..c7f4ac2dd4 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,5 +1,6 @@
-# sha256 from https://pypi.org/pypi/modbus-tk/json
-sha256  893514bbd8c92118d20a19979e0239e7cb2a63f8f1795a0271e57def09d11770  modbus_tk-1.1.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/modbus-tk/json
+md5  2e66c361d3e4591a19be1259ef50fdf7  modbus_tk-1.1.3.tar.gz
+sha256  690fa7bb86ea978992465d2d61c8b5acc639ce0e8b833a0aa96d4dd172c5644a  modbus_tk-1.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 30056bb207..d8552e57a6 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.2
+PYTHON_MODBUS_TK_VERSION = 1.1.3
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/ce/e9/30d86eb912bf868b8c97698b5747f10cf72dc26c674fd030249bc3275484
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/8d/9f/5963e30dba160dbc646b76c59ca8136709c7fe9002bbaaa3cf1e1bb0404b
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
