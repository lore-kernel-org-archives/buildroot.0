Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5140CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6475A60901;
	Sat, 21 Sep 2024 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjXZCH7s0zrz; Sat, 21 Sep 2024 21:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC5860A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC5860A6A;
	Sat, 21 Sep 2024 21:09:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14B801BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6076F6066C
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpBeqZVQRZ1E for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBBC60716
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FBBC60716
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CE7C835FF; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dee6c92ece0ff99ecc956223a01569b278582837
X-Git-Newrev: 42d46365fe5ac5b91bf4478cac429c1da8ceac21
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.7CE7C835FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydyf: bump to verison
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=42d46365fe5ac5b91bf4478cac429c1da8ceac21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index b2dac04516..f3eed45782 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  a3650927d9a84da1dc0aa1d268f21376  pydyf-0.8.0.tar.gz
-sha256  b22b1ef016141b54941ad66ed4e036a7bdff39c0b360993b283875c3f854dd9a  pydyf-0.8.0.tar.gz
+md5  271295d0295c0e5609bf142b851fa266  pydyf-0.11.0.tar.gz
+sha256  394dddf619cca9d0c55715e3c55ea121a9bf9cbc780cdc1201a2427917b86b64  pydyf-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index e9b7d229c7..5566114f8e 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.8.0
+PYTHON_PYDYF_VERSION = 0.11.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/18/dc/b607bbc7c15327c5d5ec25681a3707c847906134925d21a26ec6e7416a4a
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/2e/c2/97fc6ce4ce0045080dc99446def812081b57750ed8aa67bfdfafa4561fe5
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
