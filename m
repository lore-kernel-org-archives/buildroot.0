Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0408DC38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654234033A;
	Mon, 24 Oct 2022 21:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654234033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTuh25dUzvXf; Mon, 24 Oct 2022 21:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DF9402E1;
	Mon, 24 Oct 2022 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DF9402E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3EC41BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99DA060A83
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99DA060A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBQ3lvMseFQY for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A571660A74
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A571660A74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 936288704A; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a948e32fece110c6208c1b0fa1a05d55037a7e7
X-Git-Newrev: 07197baadb40303afd543a0ed915cbdfb87e9e08
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.936288704A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlpp: bump to version 5.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=07197baadb40303afd543a0ed915cbdfb87e9e08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.0.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlpp/libxmlpp.hash | 4 ++--
 package/libxmlpp/libxmlpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 50238eff00..a974de57e3 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.1.sha256sum
-sha256  15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098  libxml++-5.0.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
+sha256  7c17cc3e5a2214314dee5a1354f4b436f266ded6185232a0534f352a76240d5a  libxml++-5.0.2.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 874577eb1f..3db711826e 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXMLPP_VERSION_MAJOR = 5.0
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
