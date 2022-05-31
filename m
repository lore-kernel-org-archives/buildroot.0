Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51D06100F;
	Tue,  7 Jun 2022 19:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6nMY8wj9_-D; Tue,  7 Jun 2022 19:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037DF6100B;
	Tue,  7 Jun 2022 19:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17EB61BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BEA083E6F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tcGcmls96fN for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E31BB83F6F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D3DBC86E21; Tue,  7 Jun 2022 19:04:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93500eaa3f72c39507f0f4d3d20e9eaa6ed341be
X-Git-Newrev: 0c1968df1100ab575f8aba35bdd7fabc3d57e000
X-Patchwork-Hint: ignore
Message-Id: <20220607190456.D3DBC86E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-oauth2: bump version to
 0.6.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c1968df1100ab575f8aba35bdd7fabc3d57e000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index a6d00aa96e..7a0304e86a 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c5cf0d2a9f5874c289cc6044945f4771a79007bda812e5269dea3a4c92fc8811  erlang-p1-oauth2-0.6.7.tar.gz
+sha256  625e6d96a212cc2cf8a63c36ee698072791d85acbaae18e5820ba144cdaca869  erlang-p1-oauth2-0.6.10.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index d7dd45b252..50ac9fbda5 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.7
+ERLANG_P1_OAUTH2_VERSION = 0.6.10
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
