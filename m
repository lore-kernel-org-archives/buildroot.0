Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B382EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA46A612F2;
	Thu, 20 Jul 2023 21:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA46A612F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCBKs9tPBr3E; Thu, 20 Jul 2023 21:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B4761298;
	Thu, 20 Jul 2023 21:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B4761298
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4B41BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5870B6128B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5870B6128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbnvex-TS3_F for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC4D561293
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC4D561293
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9EFF8742E; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2154782c6427ca5062ba23c5047767891c514580
X-Git-Newrev: 353dddf768a278bc9a3878f5c7b607f3c5d2edf9
X-Patchwork-Hint: ignore
Message-Id: <20230720211019.E9EFF8742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-tls: bump version to
 1.1.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=353dddf768a278bc9a3878f5c7b607f3c5d2edf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to copyright year bump:
https://github.com/processone/fast_tls/commit/f5d6858f3d3c176e4c4194f4247b349c9676bdf0

Changelog:
https://github.com/processone/fast_tls/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 32d90ef7a0..9a14a44293 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5377671fed74a61518a742bc52d73941039d6e3c6e192133c7feaf5a83e1275b  erlang-p1-tls-1.1.13.tar.gz
-sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
+sha256  8c38768998e8ee0aa2bf5831bc25deeb4ea2e08bd52e26b2abfd654504fbe4f9  erlang-p1-tls-1.1.16.tar.gz
+sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 1f79bf90c1..c16a124068 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.13
+ERLANG_P1_TLS_VERSION = 1.1.16
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
