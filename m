Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49899C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6A581D24;
	Mon,  5 Dec 2022 11:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6A581D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liKXgs5l_rlF; Mon,  5 Dec 2022 11:37:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2137281D5C;
	Mon,  5 Dec 2022 11:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2137281D5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47E7F1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96E914051B
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96E914051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 908nZdGFVfak for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEF240528
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DEF240528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4896785B9B; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c75f86321131fbdbb5691dda0dce57473981c08c
X-Git-Newrev: 90c35b2c14544143d1f18c22f425f1de7bd19b2b
X-Patchwork-Hint: ignore
Message-Id: <20221205112602.4896785B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: bump to version
 4.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=90c35b2c14544143d1f18c22f425f1de7bd19b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 9b2559ab11..871bb9bfa5 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  04f5b334283e1f7f0dfeccf7d5a4b880  humanize-3.11.0.tar.gz
-sha256  4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f  humanize-3.11.0.tar.gz
+md5  5e90552713107f756788ecdd8fbe341d  humanize-4.4.0.tar.gz
+sha256  efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c  humanize-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index ea5454d6cc..04cb0713fc 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 3.11.0
+PYTHON_HUMANIZE_VERSION = 4.4.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/a6/d0/e06993724937f2aab3e7085d137d453968aaac0f74661ef9c90528a79d61
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/51/19/3e1adf0e7a8c8361496b085edcab2ddcd85410735a2b6fdd044247fc5b75
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
