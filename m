Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F002C369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC37A607C7;
	Mon, 21 Apr 2025 17:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0-8Q8zhq_mp; Mon, 21 Apr 2025 17:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB82E6075A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB82E6075A;
	Mon, 21 Apr 2025 17:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A116C68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 17:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DDA240405
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k57naYccyuYe for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 17:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9202403EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9202403EF
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 17:07:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1FBB85FF0; Mon, 21 Apr 2025 17:07:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 19:05:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 140d2f5ab9e2df1899d3f2d6d0498c5e9e679da3
X-Git-Newrev: 3d0fbaf1134ccbb89393e496c9281cb829aaeee1
X-Patchwork-Hint: ignore
Message-Id: <20250421170723.E1FBB85FF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump version to
 e4cdd9db213de15e79576b40fd3f07736ac85709
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d0fbaf1134ccbb89393e496c9281cb829aaeee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index d7f784493c..f3083e5d39 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0bac59698165a8dafdd282610246addd7bebf41612efa88c77b779f8ffb5ed9d  mender-grubenv-38e5043a215f696d126a2d707c9db9aeb93cfb2d.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  bdb055332952f471d36d30cf8148d1d34eae16b8671cfd98200eaab5bc392a7f  mender-grubenv-e4cdd9db213de15e79576b40fd3f07736ac85709.tar.gz
+sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index a47531fe58..cf2f7520c0 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 38e5043a215f696d126a2d707c9db9aeb93cfb2d
+MENDER_GRUBENV_VERSION = e4cdd9db213de15e79576b40fd3f07736ac85709
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
