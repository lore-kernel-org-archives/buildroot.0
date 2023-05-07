Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A6C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E028282199;
	Sun,  7 May 2023 12:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E028282199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSNIXY2lFBp0; Sun,  7 May 2023 12:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06504821E8;
	Sun,  7 May 2023 12:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06504821E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87BBB1BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B63404F5
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61B63404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG5Zn1AjQZCw for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:26:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7737140192
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7737140192
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E38C85F1A; Sun,  7 May 2023 12:26:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 14:23:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9aa67d7409e0c33cdbc9a6b5103f287bc87b4be5
X-Git-Newrev: ab1955c112fcfbf4d56b1c9c9ee9eb9b3fff5dd0
X-Patchwork-Hint: ignore
Message-Id: <20230507122652.5E38C85F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: update
 license info
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab1955c112fcfbf4d56b1c9c9ee9eb9b3fff5dd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include all licenses mentioned in LICENSES/README.md and update the
deprecated SPDX identifier for the GPL-2.0 license:
https://spdx.org/licenses/GPL-2.0+.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kodi-inputstream-adaptive.hash                     |  1 +
 .../kodi-inputstream-adaptive.mk                       | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 18df044c62..f94c0455bb 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  907915228335eeb9217e6f069cbb210fffce01095a6326908015cd89165a0328  kodi-inputstream-adaptive-20.3.6-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
+sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 1f3e86bb27..31b04c9e89 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -6,8 +6,22 @@
 
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.6-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
+	BSD-2-Clause-Views \
+	BSD-3-Clause \
+	google-patent-license-webm \
+	GPL-2.0-or-later \
+	RSA-MD5
+
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = \
+	LICENSE.md \
+	LICENSES/README.md \
+	LICENSES/BSD-2-Clause-Views \
+	LICENSES/BSD-3-Clause \
+	LICENSES/google-patent-license-webm \
+	LICENSES/GPL-2.0-or-later \
+	LICENSES/RSA-MD
+
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
