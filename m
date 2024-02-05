Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C434CC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB674188C;
	Mon,  5 Feb 2024 14:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB674188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viYsrfKZrXf1; Mon,  5 Feb 2024 14:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACC141B4B;
	Mon,  5 Feb 2024 14:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AACC141B4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70FAA1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57CA060E6B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CA060E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBMVHTmmXF6P for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361D460F0C
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361D460F0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2427F86CF3; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:55:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c47da268be75a64fe264f4833538be7bae1320c7
X-Git-Newrev: 8366622fc8eba8187240a0141147326e99a4f932
X-Patchwork-Hint: ignore
Message-Id: <20240205145609.2427F86CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 20.3.17-Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=8366622fc8eba8187240a0141147326e99a4f932
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index ebcf32fd4a..e38191c0c4 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1d7c933d05534e591e11fd204e836a3498fffc6a0717d5427c89acfd16fb9d40  kodi-inputstream-adaptive-20.3.15-Nexus.tar.gz
+sha256  f67cfef057f8842716db4521a8cd3966c37a1da8fc3fb297527f6f25be20688a  kodi-inputstream-adaptive-20.3.17-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 267541ace9..ba4f6de61a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.15-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.17-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
