Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0AAE6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0748E84487;
	Fri,  6 Sep 2024 20:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl5TCKJ1MI4x; Fri,  6 Sep 2024 20:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19508448E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19508448E;
	Fri,  6 Sep 2024 20:00:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4941BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 327288415A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04Yd9JMr_yPw for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F4E84159
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F4E84159
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1508A86C5A; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:41:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bdc92ceb4661c90a8e8706cce6519c5f9177318
X-Git-Newrev: 684843620a92b0dc811676cb5d94302c9dab47ac
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.1508A86C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager-openvpn: bump to
 version 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=684843620a92b0dc811676cb5d94302c9dab47ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://download.gnome.org/sources/NetworkManager-openvpn/1.12/NetworkManager-openvpn-1.12.0.news

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager-openvpn/network-manager-openvpn.hash | 2 +-
 package/network-manager-openvpn/network-manager-openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index 59d03fae2a..902dc599b9 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
 # From https://download.gnome.org/sources/NetworkManager-openvpn/1.11/NetworkManager-openvpn-1.11.0.sha256sum
-sha256  2128de06f91b33c13d63cdaa6e178bc1ca57fc770cde3bc7c24891f4d9824501  NetworkManager-openvpn-1.11.0.tar.xz
+sha256  903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514403566ae89b7e886  NetworkManager-openvpn-1.12.0.tar.xz
 # Locally computed
 sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index f39edf3209..b8a4325493 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.11
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.12
 NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).0
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
