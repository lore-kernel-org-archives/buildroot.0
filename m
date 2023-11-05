Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFF4C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3D840457;
	Sun,  5 Nov 2023 21:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E3D840457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsddk0DMlt_K; Sun,  5 Nov 2023 21:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF96402D9;
	Sun,  5 Nov 2023 21:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF96402D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A09C51BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D84B76104D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84B76104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FBlgcm2d36l for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BC2D61051
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC2D61051
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 197AF868AC; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:03:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 669ab4cbad6cc04acfe582786f893575f1f7abb2
X-Git-Newrev: 20ad8f650f24b7397565ff658174d50311ef56b8
X-Patchwork-Hint: ignore
Message-Id: <20231105211105.197AF868AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alsaaudio: bump to version
 0.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ad8f650f24b7397565ff658174d50311ef56b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index af3d0faad2..ab8b868b97 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyalsaaudio/json
-md5  5408be7d7017ae9272706acb4a543c2f  pyalsaaudio-0.9.2.tar.gz
-sha256  e74a66d6c7a6bcceb990df66d3ebc0fe382fc9d765f35f050f9d98c695304b36  pyalsaaudio-0.9.2.tar.gz
+md5  720b2e1a47a5fdb587ea1b4eabbd23e6  pyalsaaudio-0.10.0.tar.gz
+sha256  e21175500a2bd310ae3867e7991639defc1e2a5c92cf1b9f7083296b346738ab  pyalsaaudio-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ef6ba930f96986d78082e67c817ac617b9e833d60d5a0460f24c9c674a010935  LICENSE
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 205bfdb86c..0692f4a8e9 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.9.2
+PYTHON_ALSAAUDIO_VERSION = 0.10.0
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/a9/bd/24f576c07953671edfeba2545c3c92c46e97384f622957ecf95967c2b456
+PYTHON_ALSAAUDIO_SITE = https://files.pythonhosted.org/packages/e5/f0/411140b1c2d8eea8531233f39103e7ebda560030493e298be6439ce36936
 PYTHON_ALSAAUDIO_SETUP_TYPE = setuptools
 PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
