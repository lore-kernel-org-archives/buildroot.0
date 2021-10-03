Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED283C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9D61B3E
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F9D61B3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A17A60AD7;
	Sun,  3 Oct 2021 08:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0SOS9_A6st5; Sun,  3 Oct 2021 08:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF47C61710;
	Sun,  3 Oct 2021 08:23:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52A0F1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4270A426E4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sg6T9w2aiRLz for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91D3F426E0
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0B09D8DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e72a59b283d9b45c434646e9b70931a1baad80ab
X-Git-Newrev: 6e3e94d45ef331ce08b1a125ee44820a1896dd51
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.0B09D8DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-reentry: bump to version
 1.3.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e3e94d45ef331ce08b1a125ee44820a1896dd51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-reentry/python-reentry.hash | 6 +++---
 package/python-reentry/python-reentry.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
index 089d8594f5..522b936118 100644
--- a/package/python-reentry/python-reentry.hash
+++ b/package/python-reentry/python-reentry.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reentry/json
-md5	819931cd0a766a7c226879e57ccea9c7  reentry-1.3.1.tar.gz
-sha256	2fe18c1a6946f3e2a51e1d5aa78228a11e879fbb0da14da5bf1e6252e83d26b1  reentry-1.3.1.tar.gz
+md5  398c1e5bbda657aa645c8d2d38afb63f  reentry-1.3.2.tar.gz
+sha256  c6667e59aeabbb4d122aadc2170102a270e6a811d16a5431c5c3b91fabd7cf02  reentry-1.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256	4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
+sha256  4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index 428dbf2b1b..ec33c17452 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REENTRY_VERSION = 1.3.1
+PYTHON_REENTRY_VERSION = 1.3.2
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/ee/3f/a90789e01c4d2b67a57e9bd758e60ecb9338d428604f66130b57684ba8cc
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/a0/88/eb0c107c19227a2292ed11711034a3d80c0dc1368d2b3ebeb3fe7b936a8e
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
