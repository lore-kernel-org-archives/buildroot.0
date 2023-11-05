Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46106C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F126940144;
	Sun,  5 Nov 2023 21:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F126940144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0c8luwxEn8c; Sun,  5 Nov 2023 21:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0931D402B8;
	Sun,  5 Nov 2023 21:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0931D402B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129561BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A8F81F40
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A8F81F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0btCS9M6aoW for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36CC881F53
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CC881F53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27BB4868A8; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:04:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20ad8f650f24b7397565ff658174d50311ef56b8
X-Git-Newrev: 9b4efc44fa34d1a2d1191f66590ac8c7e31d70e2
X-Patchwork-Hint: ignore
Message-Id: <20231105211105.27BB4868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argh: bump to version 0.30.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b4efc44fa34d1a2d1191f66590ac8c7e31d70e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-argh/python-argh.hash | 4 ++--
 package/python-argh/python-argh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index abfcec98f3..8bfb45d1c3 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/argh/json
-md5  d51d4ed7d82ce24a981169074f3e64e1  argh-0.28.1.tar.gz
-sha256  b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d  argh-0.28.1.tar.gz
+md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
+sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
 # Locally computed
 sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
index 82cef822e9..ccb9f61d48 100644
--- a/package/python-argh/python-argh.mk
+++ b/package/python-argh/python-argh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGH_VERSION = 0.28.1
+PYTHON_ARGH_VERSION = 0.30.4
 PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
-PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/bf/77/6758074453c83c7ac0456d397e95aaa91b33fbd2ec977dcf38be736ea177
+PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
 PYTHON_ARGH_SETUP_TYPE = flit
 PYTHON_ARGH_LICENSE = LGPL-3.0+
 PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
