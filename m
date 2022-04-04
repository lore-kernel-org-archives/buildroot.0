Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26AAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 580EF81854;
	Mon,  4 Apr 2022 12:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZx6GJBq6YEl; Mon,  4 Apr 2022 12:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C34182923;
	Mon,  4 Apr 2022 12:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0E6B1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB2E4032E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C93j3uk1eZdM for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF005401F2
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CAE438619D; Mon,  4 Apr 2022 12:31:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:33:21 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5473efe73d3d4ce56b5fcca45d38ad191624181a
X-Git-Newrev: 856ffaf41cc68f787a130a6e481c7fc3ed7e629b
X-Patchwork-Hint: ignore
Message-Id: <20220404123124.CAE438619D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-paramiko:
 bump to version 2.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=856ffaf41cc68f787a130a6e481c7fc3ed7e629b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update indentation in hash file (two spaces)

https://github.com/paramiko/paramiko/blob/2.7.2/sites/www/changelog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: fix LICENSE hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fcba0aec7b840c6e6e68ba8b5b04c3b093d0f372)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-paramiko/python-paramiko.hash | 6 +++---
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 6054e8d492..b11acf1dbc 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5	bf8239dc820ca86dd3c3226f4281c35f  paramiko-2.7.1.tar.gz
-sha256	920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f  paramiko-2.7.1.tar.gz
+md5  44136d79da4cd7619e368018ad022619  paramiko-2.7.2.tar.gz
+sha256  7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035  paramiko-2.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
+sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6dc473d34e..3c135cf9b1 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.7.1
+PYTHON_PARAMIKO_VERSION = 2.7.2
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/ac/15/4351003352e11300b9f44a13576bff52dcdc6e4a911129c07447bda0a358
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
