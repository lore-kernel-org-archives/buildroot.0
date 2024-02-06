Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD163C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB098220B;
	Tue,  6 Feb 2024 12:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UsTCElvrrSJ; Tue,  6 Feb 2024 12:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A6C3826BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6C3826BB;
	Tue,  6 Feb 2024 12:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BDF31BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BBD414DA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BBD414DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14GsdC74VGyC for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BB1411A2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04BB1411A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0287B8702A; Tue,  6 Feb 2024 12:58:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 13:58:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3045d747369fd8b29be6733b5e85c286ff100552
X-Git-Newrev: 94dd060c8f8a00e1bf9dc8072c3c4c543866c946
X-Patchwork-Hint: ignore
Message-Id: <20240206125834.0287B8702A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pexpect: bump to version
 4.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=94dd060c8f8a00e1bf9dc8072c3c4c543866c946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pexpect/python-pexpect.hash | 4 ++--
 package/python-pexpect/python-pexpect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pexpect/python-pexpect.hash b/package/python-pexpect/python-pexpect.hash
index a38c8d5a03..617428feb1 100644
--- a/package/python-pexpect/python-pexpect.hash
+++ b/package/python-pexpect/python-pexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pexpect/json
-md5  153eb25184249d6a85fde9acf4804085  pexpect-4.8.0.tar.gz
-sha256  fc65a43959d153d0114afe13997d439c22823a27cefceb5ff35c2178c6784c0c  pexpect-4.8.0.tar.gz
+md5  f48d48325ee7f1221add0396ea9e2f14  pexpect-4.9.0.tar.gz
+sha256  ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398ead30f  pexpect-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a483ae1c4dc738a6c8b73feb49074e1835da02ab5aa686f2675029906fa364d  LICENSE
diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index d230b11338..469144aa60 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEXPECT_VERSION = 4.8.0
+PYTHON_PEXPECT_VERSION = 4.9.0
 PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
-PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/e5/9b/ff402e0e930e70467a7178abb7c128709a30dfb22d8777c043e501bc1b10
+PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/42/92/cc564bf6381ff43ce1f4d06852fc19a2f11d180f23dc32d9588bee2f149d
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
