Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B603C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 15:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BAF61009;
	Thu,  3 Nov 2022 15:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BAF61009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnpi7oCKYcEC; Thu,  3 Nov 2022 15:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2188660FFA;
	Thu,  3 Nov 2022 15:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2188660FFA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF9EC1BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB74F61000
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB74F61000
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODo-wwOd7fyk for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1E360B0F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA1E360B0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C930687BA6; Thu,  3 Nov 2022 15:45:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 16:44:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75eb50dcf6bfcef5b3bf2c58b795e6852ba3eab5
X-Git-Newrev: e40d6d40a6ccda3b5dffe8c45e0b833f592a48c7
X-Patchwork-Hint: ignore
Message-Id: <20221103154513.C930687BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alsaaudio: bump to version
 0.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e40d6d40a6ccda3b5dffe8c45e0b833f592a48c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index 8cc1788da4..af3d0faad2 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  b46f69561bc85fc52e698b2440ca251e  pyalsaaudio-0.8.4.tar.gz
-sha256  84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085  pyalsaaudio-0.8.4.tar.gz
+md5  5408be7d7017ae9272706acb4a543c2f  pyalsaaudio-0.9.2.tar.gz
+sha256  e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36  pyalsaaudio-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 3344583cf7..205bfdb86c 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.8.4
+PYTHON_ALSAAUDIO_VERSION = 0.9.2
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/52/b6/44871791929d9d7e11325af0b7be711388dfeeab17147988f044a41a6d83
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/a9/bd/24f576c07953671edfeba2545c3c92c46e97384f622957ecf95967c2b456
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
