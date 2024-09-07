Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E07ECE567
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 991CC4045D;
	Sat,  7 Sep 2024 20:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aNXr4PJxXxq; Sat,  7 Sep 2024 20:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FA0404C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0FA0404C3;
	Sat,  7 Sep 2024 20:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17C291BF863
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B789818CD
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5aZ8RxLsKP6 for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4412981229
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4412981229
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 408E186F3E; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 21:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69167af68962b77697d23fcb64cf4b2d0c2edd43
X-Git-Newrev: 7fafed72b345a55825ccec1f8fa14e40ca08ac4d
X-Patchwork-Hint: ignore
Message-Id: <20240907200357.408E186F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: bump to version
 0.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fafed72b345a55825ccec1f8fa14e40ca08ac4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 8c6d3c2377..21e61dd5fc 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  e182df9625d617692a9ae035266634fe  tomlkit-0.12.4.tar.gz
-sha256  7ca1cfc12232806517a8515047ba66a19369e71edf2439d0f5824f91032b6cc3  tomlkit-0.12.4.tar.gz
+md5  0db1a3750c64b141720f05430df9b433  tomlkit-0.13.2.tar.gz
+sha256  fff5fe59a87295b278abd31bec92c15d9bc4a06885ab12bcea52c71119392e79  tomlkit-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index ad82719ee2..99b974da5d 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.12.4
+PYTHON_TOMLKIT_VERSION = 0.13.2
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/7d/49/4c0764898ee67618996148bdba4534a422c5e698b4dbf4001f7c6f930797
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/b1/09/a439bec5888f00a54b8b9f05fa94d7f901d6735ef4e55dcec9bc37b5d8fa
 PYTHON_TOMLKIT_SETUP_TYPE = pep517
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
