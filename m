Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3858EC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F6960C09;
	Sat, 23 Jul 2022 17:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F6960C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00wD9vTStgjA; Sat, 23 Jul 2022 17:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFF560F71;
	Sat, 23 Jul 2022 17:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBFF560F71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFFFD1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFEE640B13
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFEE640B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyhXgOLEyNBl for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD95C40A59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD95C40A59
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8D4D681393; Sat, 23 Jul 2022 17:33:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:42:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91b167070c7f773b9d8d7bef7bfeb88b41100c2f
X-Git-Newrev: 1e88048fab32990cc0d493f1b48af01e337c257d
X-Patchwork-Hint: ignore
Message-Id: <20220723173330.8D4D681393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e88048fab32990cc0d493f1b48af01e337c257d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/vsajip/python-gnupg/blob/0.4.9/README.rst#049

The hash of the license file is changed because:

-Copyright (c) 2008-2014 by Vinay Sajip.
+Copyright (c) 2008-2022 by Vinay Sajip.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gnupg/python-gnupg.hash | 6 +++---
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index fa0e8ae6e5..f7267308f6 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  02c5d77b8db9dfba0741627560d89bd5  python-gnupg-0.4.8.tar.gz
-sha256  b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7  python-gnupg-0.4.8.tar.gz
+md5  e27cd8c6ce3b5c9197e931b65bbb4c9a  python-gnupg-0.4.9.tar.gz
+sha256  aaa748795572591aaf127b4ac8985684f3673ff82b39f370c836b006e68fc537  python-gnupg-0.4.9.tar.gz
 # Locally computed sha256 checksums
-sha256  9620da3d3afdfca7dea53c4375c1507ab2d3a4af4e706827023acb49a9ec4a5e  LICENSE.txt
+sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index fda264a0ed..582a649f9a 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.4.8
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
+PYTHON_GNUPG_VERSION = 0.4.9
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/c8/cb/46fb80639cf0dd4251aeb075a1a5e2ebbb8c9656f28ddfe9d8c99b68b6da
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
