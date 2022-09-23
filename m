Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070D1C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8BD741087;
	Fri, 23 Sep 2022 21:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8BD741087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f01NOflzLUP; Fri, 23 Sep 2022 21:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2944105A;
	Fri, 23 Sep 2022 21:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2944105A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB2951BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C768541056
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C768541056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKYJvm02-EYo for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:37:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A31CB40220
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A31CB40220
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90E4885F20; Fri, 23 Sep 2022 21:37:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:36:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e6ccf065de3e78e61a7e49ced9c61de3611077e
X-Git-Newrev: 5560bc6c161b7e15d37b1beaa57014bb2a987e53
X-Patchwork-Hint: ignore
Message-Id: <20220923213753.90E4885F20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: bump version to 1.16.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5560bc6c161b7e15d37b1beaa57014bb2a987e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kyle Harding <kyle@balena.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 8bfe48df9f..cef8edc4a2 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
-sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.3.tar.gz.sha256
+sha256  ea0c6665e2c3325b769eac1dfccd60fe1828d5fcf662650039eccb3f67edb28e  unbound-1.16.3.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a3c3ddc8e3..73a460d103 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.16.2
+UNBOUND_VERSION = 1.16.3
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
