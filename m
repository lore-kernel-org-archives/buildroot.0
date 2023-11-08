Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F4BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 09:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D53C161007;
	Wed,  8 Nov 2023 09:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D53C161007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzxidotPqSsG; Wed,  8 Nov 2023 09:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EBE61010;
	Wed,  8 Nov 2023 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EBE61010
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEC451BF97F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DEC241726
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 09:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DEC241726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOPAAgEijo8m for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9791A416E7
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9791A416E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A13086CA7; Wed,  8 Nov 2023 09:29:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 10:26:05 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: aa8bb58d819257dfe53b9c6fa879fd1852e71f85
X-Git-Newrev: 14324da2c8a292d65f4bc9acf96c34fdfc39649e
X-Patchwork-Hint: ignore
Message-Id: <20231108092926.7A13086CA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-web2py:
 bump to version 2.24.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=14324da2c8a292d65f4bc9acf96c34fdfc39649e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51c497c90fb4fb009338d223f669fb47f4900e39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index c0ce0cc352..03c71db8a5 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  f4066d76290b333bc1bb1cf4c23b612eebde712b7112e90a72e7609a14690d2c  python-web2py-2.23.1.tar.gz
+sha256  db42d52097d43fa797c29f9ce1493d7356f192dd0c2590ec56f36022252c284b  python-web2py-2.24.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 2a666cae17..91c041f6f2 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.23.1
+PYTHON_WEB2PY_VERSION = 2.24.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
