Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7593C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EC68200A;
	Thu,  3 Nov 2022 21:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83EC68200A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4gcIlyJh-v2; Thu,  3 Nov 2022 21:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 957D482008;
	Thu,  3 Nov 2022 21:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957D482008
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D31251BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C0360AAC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C0360AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0g6F23np9xDz for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C03A61023
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C03A61023
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C93E87C31; Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:05:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90572af5a930345ed7ad3001889db4e83e94dcb3
X-Git-Newrev: 96a9097ca814942951a4530ff294efedfed65036
X-Patchwork-Hint: ignore
Message-Id: <20221103210547.3C93E87C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-webpy: bump to
 version 0.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=96a9097ca814942951a4530ff294efedfed65036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License file was accidentially removed in latest release but project
is still public domain licensed.

Details:
https://github.com/webpy/webpy/commit/04bf405dd86485c8f3774c526e6a869a1eb73408

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webpy/python-webpy.hash | 6 ++----
 package/python-webpy/python-webpy.mk   | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index ed3da6b1ab..540771a244 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/web.py/json
-md5  4e7ec89e7ae1e938d01fff01ba752606  web.py-0.40.tar.gz
-sha256  dc5e42ffbc42d77d07f75b7acca9975a3368ae609774e49ddebb497a784131f3  web.py-0.40.tar.gz
-# Locally computed sha256 checksums
-sha256  791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
+md5  cd2c0296ceffa1acb96ae5315214eb42  web.py-0.62.tar.gz
+sha256  5ce684caa240654cae5950da8b4b7bc178812031e08f990518d072bd44ab525e  web.py-0.62.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 187a481286..06d4ae039b 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.40
+PYTHON_WEBPY_VERSION = 0.62
 PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
-PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/e3/23/ed84b174add09153329c6357984c8433e2f350de91c3859fa48c3cdbf7dc
+PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/cd/6e/338a060bb5b52ee8229bdada422eaa5f71b13f8d33467f37f870ed2cae4b
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
-PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
