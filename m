Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8628C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73DFB40989;
	Mon, 21 Mar 2022 16:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TffUycxCO2S6; Mon, 21 Mar 2022 16:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D0240992;
	Mon, 21 Mar 2022 16:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A04A1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5990840175
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88WxRt2J9TAF for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:34:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929B74016B
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:34:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A463884A59; Mon, 21 Mar 2022 16:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:33:21 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 178b77073e1eceb0542f7b1e76cf488dea170582
X-Git-Newrev: e453e1e4161d8db61dbc3a480ad0f4f07f566be9
X-Patchwork-Hint: ignore
Message-Id: <20220321162529.A463884A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openvpn: bump
 version to 2.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e453e1e4161d8db61dbc3a480ad0f4f07f566be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13e2912403361b6ff02a460ef8017a9927365a44)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 1d365eeab4..58751da277 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  fb6a9943c603a1951ca13e9267653f8dd650c02f84bccd2b9d20f06a4c9c9a7e  openvpn-2.5.3.tar.xz
+sha256  56c0dcd27ab938c4ad07469c86eb8b7408ef64c3e68f98497db8c03f11792436  openvpn-2.5.4.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index c07f8b4ff5..c0086b5b17 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.3
+OPENVPN_VERSION = 2.5.4
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
