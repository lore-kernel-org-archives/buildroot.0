Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E17C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0504E60230
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0504E60230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D594B60AD4;
	Wed,  4 Aug 2021 00:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cc376z-7eAT2; Wed,  4 Aug 2021 00:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E56260AC1;
	Wed,  4 Aug 2021 00:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4E0F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 738C440F98
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOX29IC71OK4 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7234340E9C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C5BA781484; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:42:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 18bad642132fda6f423c202e20df31932787885d
X-Git-Newrev: ddf0e35368443be8110a7ebbf691c624ec987bad
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.C5BA781484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dbus-glib: bump to
 version 0.112
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ddf0e35368443be8110a7ebbf691c624ec987bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update hash of COPYING (SPDX added with
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/96479fb8fd5e2f8896cdce7feff7839dcb47a7d1
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/d42176ae4763e5288ef37ea314fe58387faf2005)
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/dbus/dbus-glib/-/blob/dbus-glib-0.112/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-glib/dbus-glib.hash | 4 ++--
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 098832431e..072dde3d69 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
+sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
 
 # Locally calculated
-sha256 ef1634fc21d9112dca08f2557313584719d534d05213cf14f3c77938506266b4  COPYING
+sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5eb158d954..0d247e1d89 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.110
+DBUS_GLIB_VERSION = 0.112
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
