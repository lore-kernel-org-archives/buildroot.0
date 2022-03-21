Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF9D60687;
	Mon, 21 Mar 2022 16:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlKjxY8s_j-t; Mon, 21 Mar 2022 16:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173E060F4D;
	Mon, 21 Mar 2022 16:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5701BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6982E84144
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThTRMUsE8cnW for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:34:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B449C8413F
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C8B8D84A78; Mon, 21 Mar 2022 16:25:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:32:46 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a13ada770aab7132f994cb0ab8791df9e7fa90ae
X-Git-Newrev: 0a72aa869977513924a48463b0dac5976075b1cf
X-Patchwork-Hint: ignore
Message-Id: <20220321162534.C8B8D84A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/openvpn: bump
 version to 2.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a72aa869977513924a48463b0dac5976075b1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Release notes:
https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 54ee9363f62de602690c193e2139e0dca5c46303)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 58751da277..f8e0493b54 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  56c0dcd27ab938c4ad07469c86eb8b7408ef64c3e68f98497db8c03f11792436  openvpn-2.5.4.tar.xz
+sha256  119bd69fa0210838f6cdaa273696dc738efa200f454dbe11eb6dfb75dfb6003b  openvpn-2.5.5.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 678b024551..d6bcad62ba 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.4
+OPENVPN_VERSION = 2.5.5
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
