Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E095FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF5C60BDB;
	Mon, 27 Dec 2021 10:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H794dRKcC1X; Mon, 27 Dec 2021 10:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1223660AAB;
	Mon, 27 Dec 2021 10:19:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D619F1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A8240354
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOLhmspDfrq7 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C68140210
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60CC382B71; Mon, 27 Dec 2021 10:13:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f132391ecc61c8477df385a6ffe71d8cd95cd27
X-Git-Newrev: 8ce29b9ecfe38156363a594c5311b66b94e6389f
X-Patchwork-Hint: ignore
Message-Id: <20211227101312.60CC382B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: bump to version 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ce29b9ecfe38156363a594c5311b66b94e6389f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c2af67a0f8..80529437d1 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.9.tar.xz.asc
+# https://www.nano-editor.org/dist/v6/nano-6.0.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937  nano-5.9.tar.xz
+sha256  93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2  nano-6.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index fba318b03d..30db3249e7 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).9
+NANO_VERSION_MAJOR = 6
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
