Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7588BE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D0B81A23;
	Fri,  6 Sep 2024 20:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DgEcW6SuLo2; Fri,  6 Sep 2024 20:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E498B81E99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E498B81E99;
	Fri,  6 Sep 2024 20:01:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 457F81BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E986078F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJkGAjzcaCHw for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BCB6074D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BCB6074D
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5908286EE1; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 21:38:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62803c66e7ca4857d12489747e385e3f657daf98
X-Git-Newrev: 7321a732c2faa64713cb392b6e274546500add6e
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.5908286EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: bump to version 3.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7321a732c2faa64713cb392b6e274546500add6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since v3.0.0, see:
https://www.libvolk.org/release-v310.html
https://www.libvolk.org/release-v311.html
https://www.libvolk.org/release-v312.html

Fixes:
http://autobuild.buildroot.org/results/82cb35e9be6a57539d4e370ab2c4a4fae9d8b5d8/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/volk/volk.hash | 2 +-
 package/volk/volk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 8047a68bab..3a363f0357 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88fd80638a3683f23a8cae6c551a8cfe9ea55735c701846f3eeeeeea8a14f6a3  volk-3.0.0.tar.xz
+sha256  ce62f645c2ee3ef8b38f923de78ef4df9a1b7696d618f57781955803ee29bab3  volk-3.1.2.tar.xz
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 67475d5c90..396f4e6e8b 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VOLK_VERSION = 3.0.0
+VOLK_VERSION = 3.1.2
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 VOLK_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
