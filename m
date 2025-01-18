Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D12C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 073DC707BF;
	Fri, 28 Feb 2025 17:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbcQ3TozLKEv; Fri, 28 Feb 2025 17:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE55470715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE55470715;
	Fri, 28 Feb 2025 17:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 170281DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13B65419C9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKtAwZ07Hopv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3E6419F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3E6419F4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37C1682581; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 22:12:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3624a33e1400000021a48d8615c5bb4507f956cb
X-Git-Newrev: cc6df059980dd4fffe40c535176002c7bbdf5144
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.37C1682581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-inputstream-rtmp:
 bump version to 21.1.2-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc6df059980dd4fffe40c535176002c7bbdf5144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 7a86e54048..497efef7cf 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  193fabb14cd9d92baecf7319c50ba183bc6254385bf187fe2a726159134df2a9  kodi-inputstream-rtmp-21.1.0-Omega.tar.gz
+sha256  b7223a30d2774e4c7cbd6c4f8a266bf4d186d160590077be627bd0490d80645c  kodi-inputstream-rtmp-21.1.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 5c09144e71..7aef9c815d 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 21.1.0-Omega
+KODI_INPUTSTREAM_RTMP_VERSION = 21.1.2-Omega
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
