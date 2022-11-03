Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EEEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A978661027;
	Thu,  3 Nov 2022 21:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A978661027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QDQBl9V6HpF; Thu,  3 Nov 2022 21:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E090960769;
	Thu,  3 Nov 2022 21:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E090960769
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195D21BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39CDB40BED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39CDB40BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhX5Kww63QlV for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A4C40BE8
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A4C40BE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCD0787BCA; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c75f86321131fbdbb5691dda0dce57473981c08c
X-Git-Newrev: 90c35b2c14544143d1f18c22f425f1de7bd19b2b
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.CCD0787BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-humanize: bump
 to version 4.4.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
