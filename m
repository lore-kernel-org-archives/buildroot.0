Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD31DC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCB860F22;
	Sun, 17 Jul 2022 07:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCB860F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fHh6vE77yaV; Sun, 17 Jul 2022 07:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5993060C03;
	Sun, 17 Jul 2022 07:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5993060C03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0B61BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1883460C03
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1883460C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jGaPolQYNwQ for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517D0607CE
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517D0607CE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A1BC081DC2; Sun, 17 Jul 2022 07:06:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:19:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 490768cc8ca746a4a3956dee7a39853e868d8510
X-Git-Newrev: 9353c93a4f944fe79e4b49ee15014a8eebb26216
X-Patchwork-Hint: ignore
Message-Id: <20220717070652.A1BC081DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbytesize: bump to version 2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=9353c93a4f944fe79e4b49ee15014a8eebb26216
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/storaged-project/libbytesize/releases/tag/2.7
https://github.com/storaged-project/libbytesize/blob/2.7/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbytesize/libbytesize.hash | 2 +-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index 2dfa97dd6a..7dd572842d 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  efaa2b35b2bb3b52bf7b4ff5d0ed2c5c61360a5196053808d615dd0aa2cf0741  libbytesize-2.6.tar.gz
+sha256  8bae8287af6ef5624c320f70defdcd84ddc0c2057d3b59a5871897f27697811e  libbytesize-2.7.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index 2ef08211c5..a95ee08357 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.6
+LIBBYTESIZE_VERSION = 2.7
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
