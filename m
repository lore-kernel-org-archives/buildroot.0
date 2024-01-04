Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9840EC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A21A6158D;
	Thu,  4 Jan 2024 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A21A6158D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U70hA2UYKoAw; Thu,  4 Jan 2024 21:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585C16F4DA;
	Thu,  4 Jan 2024 21:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585C16F4DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B49271BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA56342E36
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA56342E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ow4aoH9R6fpk for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 188DF42E32
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188DF42E32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 062E184151; Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:35:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f46b472aeb5302251346fb0cfbc179dea0e14877
X-Git-Newrev: c67954bb4f30c8bf2957b4a0a76ceabab3a732cd
X-Patchwork-Hint: ignore
Message-Id: <20240104213554.062E184151@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linuxptp: bump version to 4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c67954bb4f30c8bf2957b4a0a76ceabab3a732cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index edbfb44553..1d5c590ea7 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
+sha256  70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  linuxptp-4.2.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 054442d569..e0ab82a2c4 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 4.0
+LINUXPTP_VERSION = 4.2
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
