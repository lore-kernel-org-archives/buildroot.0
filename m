Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406C5C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFFA7608CD;
	Wed, 14 Aug 2024 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iQ_QKAPfwVz; Wed, 14 Aug 2024 19:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20DDA608D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DDA608D1;
	Wed, 14 Aug 2024 19:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAC311BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9499605D7
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3ry2SgO0ab9 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 19:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF9DF608C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF9DF608C9
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 19:59:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCF1385CB2; Wed, 14 Aug 2024 19:59:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 21:48:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4715ed5970e2956646f7dbb4a576c7997e0b8181
X-Git-Newrev: 101e7b69da88148fa8333af05444e47bae631833
X-Patchwork-Hint: ignore
Message-Id: <20240814195946.CCF1385CB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuradio: bump version
 to 3.10.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=101e7b69da88148fa8333af05444e47bae631833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 3.10.7.0, see:
https://github.com/gnuradio/gnuradio/releases/tag/v3.10.8.0
https://github.com/gnuradio/gnuradio/releases/tag/v3.10.9.1
https://github.com/gnuradio/gnuradio/releases/tag/v3.10.9.2
https://github.com/gnuradio/gnuradio/releases/tag/v3.10.10.0
https://github.com/gnuradio/gnuradio/releases/tag/v3.10.11.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.hash | 2 +-
 package/gnuradio/gnuradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index f41f5a78df..855fca7ba4 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  55156650ada130600c70bc2ab38eee718fc1d23011be548471e888399f207ddc  gnuradio-3.10.7.0.tar.gz
+sha256  9ca658e6c4af9cfe144770757b34ab0edd23f6dcfaa6c5c46a7546233e5ecd29  gnuradio-3.10.11.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index bdaab86f35..d844688ff6 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.10.7.0
+GNURADIO_VERSION = 3.10.11.0
 GNURADIO_SITE = $(call github,gnuradio,gnuradio,v$(GNURADIO_VERSION))
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
