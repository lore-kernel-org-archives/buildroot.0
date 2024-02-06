Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1FDC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C5341F0E;
	Tue,  6 Feb 2024 14:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C5341F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVTlc4P7_4hV; Tue,  6 Feb 2024 14:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E23F40928;
	Tue,  6 Feb 2024 14:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E23F40928
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5131F1BF576
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE068232E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHsNJEKNbEtf for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66D4C8231C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66D4C8231C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:18:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5509F8708F; Tue,  6 Feb 2024 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 15:18:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81b9842d2ad534e3e01b9efb2b353ab3ecc1e4f7
X-Git-Newrev: 008fabd150c68d55ac1b0d676607d243df97545e
X-Patchwork-Hint: ignore
Message-Id: <20240206141842.5509F8708F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema-specifications:
 bump to version 2023.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=008fabd150c68d55ac1b0d676607d243df97545e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-jsonschema-specifications.hash                             | 4 ++--
 .../python-jsonschema-specifications.mk                               | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
index 5aaba45210..aa919681ac 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
-md5  d37762167688d8a05024b92dc8a1e20f  jsonschema_specifications-2023.7.1.tar.gz
-sha256  c91a50404e88a1f6ba40636778e2ee08f6e24c5613fe4c53ac24578a5a7f72bb  jsonschema_specifications-2023.7.1.tar.gz
+md5  de730f6937d1e3660a2d835c4f93f31b  jsonschema_specifications-2023.12.1.tar.gz
+sha256  48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc  jsonschema_specifications-2023.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 7a19eee423..40879898c9 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.7.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.12.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/12/ce/eb5396b34c28cbac19a6a8632f0e03d309135d77285536258b82120198d8
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
