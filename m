Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB22E94100
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 19:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA8A42EBF;
	Fri,  6 Oct 2023 19:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA8A42EBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ua9i0C9zCTWn; Fri,  6 Oct 2023 19:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF7443006;
	Fri,  6 Oct 2023 19:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF7443006
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAB6A1BF997
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F8A1828DF
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 19:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F8A1828DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w74QlNRVuyne for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 19:11:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F50A82CD4
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 19:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F50A82CD4
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF21C24000B;
 Fri,  6 Oct 2023 19:11:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qoqDy-00AHbO-2y; Fri, 06 Oct 2023 21:10:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Oct 2023 21:10:45 +0200
Message-Id: <20231006191049.2450822-8-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006191049.2450822-1-peter@korsgaard.com>
References: <20231006191049.2450822-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 08/12] package/gst1-python: bump to version
 1.22.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 006d4985ef..4495e03945 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.2.tar.xz.sha256sum
-sha256  bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad  gst-python-1.22.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.6.tar.xz.sha256sum
+sha256  51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5  gst-python-1.22.6.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 527d101786..475f2f2d87 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.22.2
+GST1_PYTHON_VERSION = 1.22.6
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
