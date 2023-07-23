Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104DEC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6F541506;
	Sun, 23 Jul 2023 10:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6F541506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUSvebgj_wOi; Sun, 23 Jul 2023 10:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7645341369;
	Sun, 23 Jul 2023 10:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7645341369
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3569E1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EFA860B6F
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFA860B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWInhoaEEQah for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:28:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F11460AEA
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F11460AEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BC7B82671; Sun, 23 Jul 2023 10:28:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 12:28:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d70454754142a6334ec4a7e8cc6582bbf2f4b9d
X-Git-Newrev: 260d7331bccf7f7b598d0b9e18e51a58faba0c9d
X-Patchwork-Hint: ignore
Message-Id: <20230723102839.2BC7B82671@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5{webview,
 x11extras}: fix hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=260d7331bccf7f7b598d0b9e18e51a58faba0c9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 6b23dff9e71786191797d3b41ce80afe659f0396 forgot to
update the hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webview/qt5webview.hash     | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index fe12950929..d928c7cdce 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6b84aab9bc8292f299b249840218e9e69a1dbbff42e08c5da7cb659cff8bc37d  qtwebview-826d2a33929c69807917536d48b7861e7682001e.tar.bz2
+sha256  38f6c0a2863e9144632286b0ef43db506b8631eeff0f8facae14b0da86ca0491  qtwebview-87577dde04ed219bda776dabca86176149736331.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 7b369b0a02..87dac8625e 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fde322c017bee349d56f73f402ca67ad986e0c43a592e3ee032313aa194406da  qtx11extras-51b0a5a2e3e35f4cb17da1e7cb4babef6294bfb4.tar.bz2
+sha256  cf9124f3d35f1c8db4e9e47943cb1ec86834abf2be38d70412d0452e64462906  qtx11extras-982f20eb585d77e5b5c721e05a466d7161f7f2d1.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
