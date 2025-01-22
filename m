Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3CCC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 17:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF7B642D5B;
	Wed, 22 Jan 2025 17:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCMk26j27OsD; Wed, 22 Jan 2025 17:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99F5412FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99F5412FB;
	Wed, 22 Jan 2025 17:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2211BB88
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2B1A704E5
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W28sbPmxQqD for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 17:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1506E6FAEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1506E6FAEC
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1038A860DD; Wed, 22 Jan 2025 17:34:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 18:29:28 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9e548b1c0924d61ba6c9cce6054d34ccfaa62b3f
X-Git-Newrev: b3b7106324667b76567680cecf7434b306ee3d8b
X-Patchwork-Hint: ignore
Message-Id: <20250122173446.1038A860DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openvpn: bump
 version to 2.6.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3b7106324667b76567680cecf7434b306ee3d8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/59119248/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0aadb0b5dc45ccb940d6ea4be3a73cc0bd7bb222)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 7ba3ea3f20..3c95ff4965 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929  openvpn-2.6.12.tar.gz
+sha256  1af10b86922bd7c99827cc0f151dfe9684337b8e5ebdb397539172841ac24a6a  openvpn-2.6.13.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 4bf5b54656..e484a4e80f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.12
+OPENVPN_VERSION = 2.6.13
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
