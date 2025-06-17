Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE25DC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E96483B9E;
	Tue, 17 Jun 2025 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTtbHzrtl1q1; Tue, 17 Jun 2025 20:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F81583B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F81583B91;
	Tue, 17 Jun 2025 20:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E910E151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA73940629
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzrgqO6Fn41r for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E8144051A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E8144051A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D3C683C97; Tue, 17 Jun 2025 20:07:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 22:05:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3463f4129f90cd6eb12343ef0dfd89539806242
X-Git-Newrev: 31fb707f3301965fc9c7fd45af18f700325486a8
X-Patchwork-Hint: ignore
Message-Id: <20250617200718.0D3C683C97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iniconfig: bump to 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=31fb707f3301965fc9c7fd45af18f700325486a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for changelog.

This commit also updates the LICENSE hash, due to minor reformatting.
See [2].

[1] https://github.com/pytest-dev/iniconfig/blob/v2.1.0/CHANGELOG
[2] https://github.com/pytest-dev/iniconfig/commit/f81ae0314363f35e36e01926a3a87d67eea50c39

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Julien:
 - update changelog link to use tag
 - fix LICENCE hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-iniconfig/python-iniconfig.hash | 6 +++---
 package/python-iniconfig/python-iniconfig.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 541ae3e3f3..7e5884bb7c 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  3c030b3f51dcc3aca585de05635600e4  iniconfig-2.0.0.tar.gz
-sha256  2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3  iniconfig-2.0.0.tar.gz
+md5  437ede5b20b0ab2e76ca08f02b5c49dd  iniconfig-2.1.0.tar.gz
+sha256  3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7  iniconfig-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
+sha256  3409fa91f7ace557894632676656e32264fe5ef7581535725dc9a23774551bd4  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 7c6cd14907..3276032fd3 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.0.0
+PYTHON_INICONFIG_VERSION = 2.1.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/d7/4b/cbd8e699e64a6f16ca3a8220661b5f83792b3017d0f79807cb8708d33913
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3
 PYTHON_INICONFIG_SETUP_TYPE = hatch
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
