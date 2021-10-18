Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D43C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6632661002
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6632661002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A942400EF;
	Mon, 18 Oct 2021 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSIMNyNABHL1; Mon, 18 Oct 2021 19:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B8E4401CA;
	Mon, 18 Oct 2021 19:53:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEE01BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CA9460629
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mpmRpkkprVY for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:53:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0D4C605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:53:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8733B87751; Mon, 18 Oct 2021 19:50:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:52:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abb13eef20aebd45aaf07e1481c5568808d35245
X-Git-Newrev: 1a6131331fe2db3a6b3c921fa14d88011871a4e7
X-Patchwork-Hint: ignore
Message-Id: <20211018195041.8733B87751@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump to version 1.42.0-0
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
Content-Type: multipart/mixed; boundary="===============1732481224568472960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1732481224568472960==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1a6131331fe2db3a6b3c921fa14d88011871a4e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 2711328f3f..6dfd8b9f19 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  abc3bd9d741aec392203dbf629da58817bd5705e82b2e9f79f4486172674a0a3  luv-1.41.1-0.tar.gz
+sha256  b5228a9d0eaacd9f862b6270c732d5c90773a28ce53b6d9e32a14050e7947f36  luv-1.42.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index b9f0d6a070..fae94fa6b2 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.41.1-0
+LUV_VERSION = 1.42.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt

--===============1732481224568472960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1732481224568472960==--
