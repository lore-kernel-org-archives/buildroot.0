Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9A0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C294B415D9;
	Fri, 29 Apr 2022 18:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3k6ANSNyLpGl; Fri, 29 Apr 2022 18:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B23410C6;
	Fri, 29 Apr 2022 18:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9E71BF855
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 18:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BF6D83EBF
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 18:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRj1pI7F0U5s for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 18:37:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD33783E92
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 18:37:13 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout05.t-online.de (Postfix) with SMTP id 1353512D13
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 20:37:11 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.173]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nkVUL-1c9vTV0; Fri, 29 Apr 2022 20:37:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38672)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nkVUL-0006Xb-00
 for buildroot@buildroot.org; Fri, 29 Apr 2022 20:37:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 29 Apr 2022 20:37:08 +0200
Message-Id: <20220429183708.3819668-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220429183708.3819668-1-bernd.kuhls@t-online.de>
References: <20220429183708.3819668-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651257429-0001606D-853A51D3/0/0 CLEAN NORMAL
X-TOI-MSGID: 57958eab-4a32-4843-98c5-3427adf6874a
Subject: [Buildroot] [PATCH 2/2] package/tor: bump version to 0.4.7.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://forum.torproject.net/t/stable-release-0-4-7-7/3108

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 3 ++-
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 16e01c80a9..8f37dd6219 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,4 @@
+# From https://dist.torproject.org/tor-0.4.7.7.tar.gz.sha256sum
+sha256  3e131158b52b9435d7e43d1c47ef288b96d005342cc44b8c950bb403851a5b44  tor-0.4.7.7.tar.gz
 # Locally computed
-sha256  94ccd60e04e558f33be73032bc84ea241660f92f58cfb88789bda6893739e31c  tor-0.4.6.10.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 78a6de66dc..3b470a80d8 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.6.10
+TOR_VERSION = 0.4.7.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
