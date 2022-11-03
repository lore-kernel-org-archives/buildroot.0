Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C06C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ED2E40BDB;
	Thu,  3 Nov 2022 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED2E40BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fIww3VJDMxC; Thu,  3 Nov 2022 21:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B0140BC6;
	Thu,  3 Nov 2022 21:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B0140BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 346101BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9782141715
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9782141715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1vuxdIBgkpQ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1F84179D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1F84179D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AADCF87BCC; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bca80837c380d71b00b1923980067a171b80084d
X-Git-Newrev: b53b980881c4e19b42de624c23ffc2ad619ac3f1
X-Patchwork-Hint: ignore
Message-Id: <20221103205512.AADCF87BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-msgfy: bump to
 version 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b53b980881c4e19b42de624c23ffc2ad619ac3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-msgfy/python-msgfy.hash | 4 ++--
 package/python-msgfy/python-msgfy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
index c795f7fa5e..9f5bfe4804 100644
--- a/package/python-msgfy/python-msgfy.hash
+++ b/package/python-msgfy/python-msgfy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgfy/json
-md5  4a3d8ac9908acd5f661a58b12f9e0d17  msgfy-0.1.0.tar.gz
-sha256  474c08302cd56ccee1300ac7976a01ebd1e42716fc9bcd947d39a311a15b7012  msgfy-0.1.0.tar.gz
+md5  1727a08a0cf7fb704045168c71993280  msgfy-0.2.0.tar.gz
+sha256  37c907cccb19afe73ce44111a21b410b685be92c9c44496bc4381fd93c5ad7b6  msgfy-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index c187061d41..4100a912b2 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGFY_VERSION = 0.1.0
+PYTHON_MSGFY_VERSION = 0.2.0
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/24/b5/7cc6ba75b6489245f9b75f11a85202b934fa92f6c99a4fa1c639f08d68e8
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/c6/2a/663ef86625f34ee4165da1eb824442cfb1f676e892946d7fe39a8c775682
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
