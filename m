Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F5EC61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D90281F46;
	Thu, 12 Jan 2023 19:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D90281F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhDgdMr-isXH; Thu, 12 Jan 2023 19:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59F281F6A;
	Thu, 12 Jan 2023 19:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59F281F6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB1AA1BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8749E60E33
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8749E60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GM8X4n5Ic4JY for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB5EE60D4D
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB5EE60D4D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A732E87A9F; Thu, 12 Jan 2023 19:32:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:26:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 189543e4ab6c421001209423cce45c75e3242d75
X-Git-Newrev: f397197b3658968931a5a4b273fcebf5fdca1569
X-Patchwork-Hint: ignore
Message-Id: <20230112193229.A732E87A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 5.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f397197b3658968931a5a4b273fcebf5fdca1569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 3dfc681167..759cafc250 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  45a74680e2936470821bf74a8f043a71  ujson-5.6.0.tar.gz
-sha256  f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04  ujson-5.6.0.tar.gz
+md5  f93bd7aa33e3e6ed41c9e3782abe7b48  ujson-5.7.0.tar.gz
+sha256  e788e5d5dcae8f6118ac9b45d0b891a0d55f7ac480eddcb7f07263f2bcf37b23  ujson-5.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 24ad4822b8..3afd33cb5a 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.6.0
+PYTHON_UJSON_VERSION = 5.7.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/45/48/466d672c53fcb93d64a2817e3a0306214103e3baba109821c88e1150c100
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/1a/b0a027144aa5c8f4ea654f4afdd634578b450807bb70b9f8bad00d6f6d3c
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
