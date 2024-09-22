Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2251CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA62E80C1C;
	Sun, 22 Sep 2024 10:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKeQEMg0BfkS; Sun, 22 Sep 2024 10:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3206881EFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3206881EFD;
	Sun, 22 Sep 2024 10:36:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2D6F1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76070401ED
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCQQov6DzB09 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A24A64034A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24A64034A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E2F8800D2; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:31:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a42582a2c4e1d75ae1162e0008c0a3cff6aa01a
X-Git-Newrev: 2cc845756e3e5012bcb1b88bdf72dd14fbd361b7
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.9E2F8800D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yatl: bump to version
 20230507.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cc845756e3e5012bcb1b88bdf72dd14fbd361b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add previously missing license file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-yatl/python-yatl.hash | 6 ++++--
 package/python-yatl/python-yatl.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 61391f6370..5e11fcc17d 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  f02b367e1c56af94eafd5bd1019c03be  yatl-20220907.1.tar.gz
-sha256  67d43ad79e1f58d8552718018470856a2ad210bdfeec42e978b28b1b21560d00  yatl-20220907.1.tar.gz
+md5  aa1ee295477870a084a891f864fb6f0f  yatl-20230507.3.tar.gz
+sha256  a7d60abff563d7eb680f4f97efb107b60b32f80061c45bf4fab15c4ea2a057e2  yatl-20230507.3.tar.gz
+# Locally computed sha256 checksums
+sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 0c33971b89..aaafef8988 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20220907.1
+PYTHON_YATL_VERSION = 20230507.3
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/09/68/0c9d0a1192fdad5f3d38db096106c5adabb9b26c9ae107897997f56d1788
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/bd/3b/723a667a24512a299e1e139608e787c3b24b7819302c15c7aac09c3bec68
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
+PYTHON_YATL_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
