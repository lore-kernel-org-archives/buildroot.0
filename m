Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03264CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9EB76137D;
	Tue, 14 Oct 2025 22:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-cvckWTbqeF; Tue, 14 Oct 2025 22:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14284612D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14284612D4;
	Tue, 14 Oct 2025 22:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F1B4C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB6194066B
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY5WenSExicO for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 22:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DDCA40723
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DDCA40723
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B68F87100; Tue, 14 Oct 2025 22:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:58:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409309c16047501c818399499edb56fd5458be95
X-Git-Newrev: 306ddbcfd63e181a9f44e358ad0c102b2d5d1edd
X-Patchwork-Hint: ignore
Message-Id: <20251014220002.5B68F87100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setproctitle: bump version
 to 1.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=306ddbcfd63e181a9f44e358ad0c102b2d5d1edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license file name and hash due to upstream commits:
https://github.com/dvarrazzo/py-setproctitle/commit/9950f38639e8bbda8d208bd4b8ec0531821e26a8
https://github.com/dvarrazzo/py-setproctitle/commit/11d5ba71f0dc2bee2deb32ad17ac577101d404cd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 0076b0268f..3520520df8 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  9971bff3c4dc79e31565f1f79adb97af  setproctitle-1.3.4.tar.gz
-sha256  3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50  setproctitle-1.3.4.tar.gz
+md5  422cd04321b1aa0f4b56d51d10ae5bb8  setproctitle-1.3.7.tar.gz
+sha256  bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e  setproctitle-1.3.7.tar.gz
 # Locally computed sha256 checksums
-sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
+sha256  4bb8a954b08857aaecf1da3ecd722ab810d3899f2ab386052bbe27f5ff24a02a  LICENSE
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 6698000eb2..7821eb5225 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.4
+PYTHON_SETPROCTITLE_VERSION = 1.3.7
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ae/4e/b09341b19b9ceb8b4c67298ab4a08ef7a4abdd3016c7bb152e9b6379031d
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/8d/48/49393a96a2eef1ab418b17475fb92b8fcfad83d099e678751b05472e69de
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
-PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
+PYTHON_SETPROCTITLE_LICENSE_FILES = LICENSE
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
