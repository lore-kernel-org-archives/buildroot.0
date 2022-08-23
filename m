Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4843DC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9F2940447;
	Tue, 23 Aug 2022 19:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F2940447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgoXGmq4PXpo; Tue, 23 Aug 2022 19:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECDE440323;
	Tue, 23 Aug 2022 19:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECDE440323
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67B3F1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 425C88199D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 425C88199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m13pJJSXe01f for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:31:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6573381971
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6573381971
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3CB4987B1C; Tue, 23 Aug 2022 19:16:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:29:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 590bc8efb6c54539471826974b4e457dd1e99034
X-Git-Newrev: 9bbcc554dd12acdbdd1484f17e72423658982025
X-Patchwork-Hint: ignore
Message-Id: <20220823191644.3CB4987B1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-fonttools: bump
 to version 4.36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bbcc554dd12acdbdd1484f17e72423658982025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 469fea9c19..4f6536dbfb 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  197ad603c91d4c2909acf9e54c26e85f  fonttools-4.34.4.zip
-sha256  9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0  fonttools-4.34.4.zip
+md5  5eb0df388216de4bfd058153d16c75bf  fonttools-4.36.0.zip
+sha256  e637d2fe06bddabbfc488e02ef32d04d561e3c71e9ba11abc7782ea753ceb218  fonttools-4.36.0.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c35c538cb6..6281359e86 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.34.4
+PYTHON_FONTTOOLS_VERSION = 4.36.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/df/4b/ca51dbaf267decfcc7ca9300cdc703206c1c05f3e2beb5140a71817c2d7e
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
