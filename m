Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB36C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AED6080E;
	Mon, 13 May 2024 19:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJz5e-y4BIg7; Mon, 13 May 2024 19:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA72E6086F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA72E6086F;
	Mon, 13 May 2024 19:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 620B61BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B7AD4076C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynyIeCAwof_n for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AE744076B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AE744076B
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48B3D87114; Mon, 13 May 2024 19:37:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:36:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22fd54b737d81ceb8b1cb0ccb0896c0b914b02cd
X-Git-Newrev: bd4efc86c90b85fbd5825f6b2eab49790e09f601
X-Patchwork-Hint: ignore
Message-Id: <20240513193737.48B3D87114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager-openvpn: bump to
 version 1.11.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd4efc86c90b85fbd5825f6b2eab49790e09f601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.news

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager-openvpn/network-manager-openvpn.hash | 4 ++--
 package/network-manager-openvpn/network-manager-openvpn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index 11fb28f8c8..59d03fae2a 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/NetworkManager-openvpn/1.10/NetworkManager-openvpn-1.10.2.sha256sum
-sha256  62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21  NetworkManager-openvpn-1.10.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.sha256sum
+sha256  2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501  NetworkManager-openvpn-1.11.0.tar.xz
 # Locally computed
 sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index ccc86e45f7..f39edf3209 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.10
-NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).2
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.11
+NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).0
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
