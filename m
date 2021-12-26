Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADACBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64DD840888;
	Sun, 26 Dec 2021 22:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gr1xFIiIdTHN; Sun, 26 Dec 2021 22:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A95A24029B;
	Sun, 26 Dec 2021 22:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B23351BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A166081471
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KF1mG1MgIzQc for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFB9881455
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2949682B6F; Sun, 26 Dec 2021 22:28:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:33:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 309918ee028bb62329df49e40f6c9ef0455c5fe5
X-Git-Newrev: 24e4c888c3d36e3943206ea55894b84344cc8b2e
X-Patchwork-Hint: ignore
Message-Id: <20211226222809.2949682B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: bump to version 11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=24e4c888c3d36e3943206ea55894b84344cc8b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/hsleisink/hiawatha/-/blob/v11.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 2fba5600a2..b06dc2e661 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79d85d165d68dd7043bbd337f5bc7dd10d8632d68ba61d0e557f84bd687c9727  hiawatha-10.11.tar.gz
+sha256  d21722986f64163e30a560283123cdf4d6cb5ff8188ab754387b26724565268d  hiawatha-11.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index a917adc9a4..5618e6900d 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.11
+HIAWATHA_VERSION = 11.1
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
