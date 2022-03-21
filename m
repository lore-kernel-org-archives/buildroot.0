Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E824C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8BE8414A;
	Mon, 21 Mar 2022 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rs3NakjNGIk; Mon, 21 Mar 2022 16:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2BA84144;
	Mon, 21 Mar 2022 16:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B70F1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4520D60F6D
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3ovpJTg_oOQ for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:34:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C84660F4D
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:34:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9ADFF84A58; Mon, 21 Mar 2022 16:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:33:13 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: bbaac16fcae7bd4030f640e7cbfa2d8ffc001423
X-Git-Newrev: 178b77073e1eceb0542f7b1e76cf488dea170582
X-Patchwork-Hint: ignore
Message-Id: <20220321162529.9ADFF84A58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openvpn: bump
 version to 2.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=178b77073e1eceb0542f7b1e76cf488dea170582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release note:
https://forums.openvpn.net/viewtopic.php?f=20&t=32497

CVE-2021-3606 fixed by this release is only relevant for Windows.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e9f13a76eec48ac67af33d8d3ef6d068ff40e7ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 36f90ff111..1d365eeab4 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  b12743836901f365efaf82ab2493967e1b21c21eb43ce9a8da1002a17c9c1dc8  openvpn-2.5.2.tar.xz
+sha256  fb6a9943c603a1951ca13e9267653f8dd650c02f84bccd2b9d20f06a4c9c9a7e  openvpn-2.5.3.tar.xz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9b3802fd80..c07f8b4ff5 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.2
+OPENVPN_VERSION = 2.5.3
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
