Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB32D3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D71060794;
	Sat, 19 Oct 2024 18:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BA3IznXsiwl; Sat, 19 Oct 2024 18:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C65E607BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C65E607BE;
	Sat, 19 Oct 2024 18:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73CA427D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F5FA405B7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9U1AN22ZUxE for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CD240571
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75CD240571
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56F3585FDE; Sat, 19 Oct 2024 18:12:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 20:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9e86b9c8d87ce31d06865a17f81b289a252c04f
X-Git-Newrev: 71d2c23b11d4b21644a6597338aa39368b01fdf7
X-Patchwork-Hint: ignore
Message-Id: <20241019181223.56F3585FDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: bump version to 2.5.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71d2c23b11d4b21644a6597338aa39368b01fdf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pppd/pppd.hash | 2 +-
 package/pppd/pppd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index bf22650884..92f036df58 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  535efa0e7c36e9d443b1b52c296d63ab2c1ec9458816ea0e37c701e0a921466d  pppd-e1266c76d1ad39f98f11676e34f180f78c5a510c.tar.gz
+sha256  c0537067bdff5f0b5d7a2fd1cca13c220f6dadc89183f23739a2cf9df49c68ca  pppd-2.5.1.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index d996a39120..4b65cf08d1 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -6,8 +6,8 @@
 
 # The tarball provided at https://download.samba.org/pub/ppp/ does not
 # include the license files yet so we use the github tarball.
-PPPD_VERSION = e1266c76d1ad39f98f11676e34f180f78c5a510c
-PPPD_SITE = $(call github,ppp-project,ppp,$(PPPD_VERSION))
+PPPD_VERSION = 2.5.1
+PPPD_SITE = $(call github,ppp-project,ppp,ppp-$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
 PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
