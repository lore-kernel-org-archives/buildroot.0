Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1934C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D71960FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D71960FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67A7683DF3;
	Wed,  4 Aug 2021 00:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkh1ESEbcu2s; Wed,  4 Aug 2021 00:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF6983D58;
	Wed,  4 Aug 2021 00:10:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2478D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAAF40EDC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAsS3lcUILQW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B997840660
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1775586A84; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 22:59:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 40fe600f17ce0cfb7377d6a02230a171d4d174ac
X-Git-Newrev: d5534404ef67d94d297aa904557553781b8e712a
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.1775586A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-certifi: bump
 to version 2021.5.30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d5534404ef67d94d297aa904557553781b8e712a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to typo fix:
https://github.com/certifi/python-certifi/commit/c5311ad0533e78240f34b0e35451794d0e261d54

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 7605672514..ae122ffc23 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  522f9abe26e5d603a668d812aa6accca  certifi-2020.12.5.tar.gz
-sha256  1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c  certifi-2020.12.5.tar.gz
+md5  4b38238b7305fcb3ffbc4368be4e8845  certifi-2021.5.30.tar.gz
+sha256  2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee  certifi-2021.5.30.tar.gz
 # Locally computed sha256 checksums
-sha256  6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
+sha256  be9d82f36112f87a7f1d74ecd4887e1467bbae8878a84004a00117b1e475a3e2  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 4e4cbfdc81..7c63633a8d 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2020.12.5
+PYTHON_CERTIFI_VERSION = 2021.5.30
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
