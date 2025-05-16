Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445EAC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DA7810BD;
	Fri, 16 May 2025 14:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVdnKfr8464a; Fri, 16 May 2025 14:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E57D8130C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E57D8130C;
	Fri, 16 May 2025 14:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AB65185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70B0380FC6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYpYEQxdZLOr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E4FB810BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E4FB810BD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9681986CB5; Fri, 16 May 2025 14:59:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:48:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc827edb6585d77ad8d866953af2f649c8e1e1a8
X-Git-Newrev: 69ac2100c61edc9260c557212ff5d9c7f3be293e
X-Patchwork-Hint: ignore
Message-Id: <20250516145945.9681986CB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-psutil: new host
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69ac2100c61edc9260c557212ff5d9c7f3be293e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-types-psutil/python-types-psutil.hash |  5 +++++
 package/python-types-psutil/python-types-psutil.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
new file mode 100644
index 0000000000..a1d673f2b1
--- /dev/null
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/types-psutil/json
+md5  411972eff624e78ca26706d297cde546  types_psutil-6.1.0.20241221.tar.gz
+sha256  600f5a36bd5e0eb8887f0e3f3ff2cf154d90690ad8123c8a707bba4ab94d3185  types_psutil-6.1.0.20241221.tar.gz
+# Locally computed sha256 checksums
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
new file mode 100644
index 0000000000..50ae884c85
--- /dev/null
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-types-psutil
+#
+################################################################################
+
+PYTHON_TYPES_PSUTIL_VERSION = 6.1.0.20241221
+PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/44/8c/5f82cd554cc5bb79d137f082e4c9f8d22e85c8c08dabee4971d422a9abdd
+PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
+PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
+PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
