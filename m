Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F1DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3CF41950;
	Mon,  6 Nov 2023 21:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3CF41950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIRjH6DIU9lS; Mon,  6 Nov 2023 21:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91B741F45;
	Mon,  6 Nov 2023 21:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A91B741F45
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70A8F1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4859B41F45
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4859B41F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PslaG7Wp1-VP for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A2741E99
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A2741E99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D5D586A34; Mon,  6 Nov 2023 21:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:09:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47e44900bf89d280552eca508e5253ed8d286074
X-Git-Newrev: 054d55831d892c617e94273771a78da75e43ace6
X-Patchwork-Hint: ignore
Message-Id: <20231106210936.4D5D586A34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-brotli: bump to version
 1.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=054d55831d892c617e94273771a78da75e43ace6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-brotli/python-brotli.hash |  4 ++--
 package/python-brotli/python-brotli.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index de4964dd25..e8036d3bb8 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  08f1f098697c64aa4596468b556d0c94  Brotli-1.0.9.zip
-sha256  4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438  Brotli-1.0.9.zip
+md5  908d109a0309c33b626d01137eb4a060  Brotli-1.1.0.tar.gz
+sha256  81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724  Brotli-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index ff78e6ab2c..865c4e363f 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.0.9
-PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).zip
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2a/18/70c32fe9357f3eea18598b23aa9ed29b1711c3001835f7cf99a9818985d0
+PYTHON_BROTLI_VERSION = 1.1.0
+PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).tar.gz
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
@@ -19,10 +19,4 @@ endif
 
 PYTHON_BROTLI_ENV = CFLAGS="$(PYTHON_BROTLI_CFLAGS)"
 
-define PYTHON_BROTLI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_BROTLI_DL_DIR)/$(PYTHON_BROTLI_SOURCE)
-	mv $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)/* $(@D)
-	$(RM) -r $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)
-endef
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
