Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D2DCD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 21:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B506072E;
	Sat, 31 Aug 2024 21:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQKCr0vPmhst; Sat, 31 Aug 2024 21:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4CA60748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4CA60748;
	Sat, 31 Aug 2024 21:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80D331BF588
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B52540432
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoKufNfFSW-H for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B3D40139
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63B3D40139
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ED0B8682C; Sat, 31 Aug 2024 21:49:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 23:45:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f34d38cdb5790e665d0e4d7f14a78356c9fbd767
X-Git-Newrev: 79dc5bc96c743da646f7fee48baf1065e868e4b1
X-Patchwork-Hint: ignore
Message-Id: <20240831214953.4ED0B8682C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openvpn: bump
 version to 2.6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=79dc5bc96c743da646f7fee48baf1065e868e4b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/58796813/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3da0a950e02932c81e516d818a5b3731134376d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index a4ba458bd8..7ba3ea3f20 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  d60adf413d37e11e6e63531cacf2655906756046b4edffe88a13b9e2fec40d5e  openvpn-2.6.11.tar.gz
+sha256  1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929  openvpn-2.6.12.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3b39d62519..4bf5b54656 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.11
+OPENVPN_VERSION = 2.6.12
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
