Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED83CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA83613A1;
	Tue, 14 Oct 2025 22:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMcah-NvQ3Pg; Tue, 14 Oct 2025 22:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BCB61313
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BCB61313;
	Tue, 14 Oct 2025 22:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9A771C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F1B40723
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiF6ePptUJVc for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7CE4079E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC7CE4079E
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9FCB87103; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 400cbb1f480cf5a44aca678b6959f53f89c12540
X-Git-Newrev: bdb107998ed4fcbcf52d3a4afaf9043f4abb92c8
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.A9FCB87103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: bump version to
 2.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdb107998ed4fcbcf52d3a4afaf9043f4abb92c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit
https://github.com/jquast/telnetlib3/commit/b7dfcb60672c0cdca6c69941a21fab119f96f1f2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-telnetlib3/python-telnetlib3.hash | 6 +++---
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index db18889b8f..135b985625 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  2dfac7e10ed63c408da50ea712415f87  telnetlib3-2.0.4.tar.gz
-sha256  dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d  telnetlib3-2.0.4.tar.gz
+md5  effe967417ede0c7dadcc3ccd3263d5f  telnetlib3-2.0.8.tar.gz
+sha256  08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752  telnetlib3-2.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  caaf4ac82c4363d4874a49b50af15797618f6aee5bf42218697cdcb41c391ca5  LICENSE.txt
+sha256  df4b9fddd41b5811d9ba61952c7513ab3b0ca1d00efe611d19c51eda756f5dd1  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index e68533af5c..d8968d4f15 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 2.0.4
+PYTHON_TELNETLIB3_VERSION = 2.0.8
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/ef/af/0fadfddd1764e627f4ba9c7381caaf121795ed459a1cc3d0fbb89a187954
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b7/12/305101cfdec4863c088e520cbb698b08ebd3396904ecfe0062612db77c66
 PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
