Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B52C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCA76F8E0;
	Wed,  3 Aug 2022 16:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCA76F8E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uaj7dJXEFHJ5; Wed,  3 Aug 2022 16:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F2D6610D2;
	Wed,  3 Aug 2022 16:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2D6610D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D35271BF9B9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF5FE610C7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF5FE610C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZufeteidume for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:17:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3BED610C0
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3BED610C0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6190A86D4A; Wed,  3 Aug 2022 16:03:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 09:34:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 417eb476fd180659e5b1cc8e16fe8ac95f1f391a
X-Git-Newrev: 4d795dc7bfd74315874b61a98ed588c63892116b
X-Patchwork-Hint: ignore
Message-Id: <20220803160350.6190A86D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: bump version to 1.16.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d795dc7bfd74315874b61a98ed588c63892116b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kyle Harding <kyle@balena.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 68087cc28e..8bfe48df9f 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
-sha256  6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5  unbound-1.16.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
+sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 8863d039bb..a3c3ddc8e3 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.16.0
+UNBOUND_VERSION = 1.16.2
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
