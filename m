Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B68C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D89981865;
	Mon,  5 Dec 2022 11:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D89981865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tje7cs-8tKdp; Mon,  5 Dec 2022 11:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB11381D02;
	Mon,  5 Dec 2022 11:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB11381D02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4FC1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 235A541607
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 235A541607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVKJfICSnlZL for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5FF841615
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5FF841615
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2F8A85BA2; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770ba1fa01432de1ecef979267b88cd94194c6b1
X-Git-Newrev: 7e5672420ba9c4e30d71460b60b3f6207baf12a3
X-Patchwork-Hint: ignore
Message-Id: <20221205112604.C2F8A85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytablereader: bump to
 version 0.31.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e5672420ba9c4e30d71460b60b3f6207baf12a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License verified as still MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytablereader/python-pytablereader.hash | 6 +++---
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 675ce5680e..2034cfd61e 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5  23ba6121e2f916dfbf4015516779dfcd  pytablereader-0.26.1.tar.gz
-sha256  f2e1477de8886267b765af7861baacc65606761bfabb0689f118cc5d27861f26  pytablereader-0.26.1.tar.gz
+md5  8d732b706186666a4c28d14927c26754  pytablereader-0.31.3.tar.gz
+sha256  e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11  pytablereader-0.31.3.tar.gz
 # Locally computed sha256 checksums
-sha256  7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index 0f9e4c593a..daa484d393 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.26.1
+PYTHON_PYTABLEREADER_VERSION = 0.31.3
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/1e/bc/f60da8a733cd87215d8533f28536f8149eca3b898bbca346b37b6c915d8d
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/b5/c8/67590578e27cb1716c7b71291946d685b5bf63fbfe7a254a7cb3f6f8aeab
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
