Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6900CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFBB840AB;
	Wed, 15 Oct 2025 07:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ytBYpXyf95W; Wed, 15 Oct 2025 07:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA54840AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA54840AD;
	Wed, 15 Oct 2025 07:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 798931BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBDD941400
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSyl7iTIfTl1 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA543408FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA543408FA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E760D870FF; Wed, 15 Oct 2025 07:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 08:51:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ee27919c52853424efeffd17cd1855ee7b6c94f
X-Git-Newrev: c563222e9339ab3f4a80c038b5cb9426a46530f7
X-Patchwork-Hint: ignore
Message-Id: <20251015071659.E760D870FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zipstream-ng: bump version
 to 1.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=c563222e9339ab3f4a80c038b5cb9426a46530f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-zipstream-ng/python-zipstream-ng.hash | 4 ++--
 package/python-zipstream-ng/python-zipstream-ng.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
index 6feb23834d..4360cd07b3 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.hash
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
-md5  f30b8347aaceee3f4ddc01bda851790a  zipstream_ng-1.8.0.tar.gz
-sha256  b7129d2c15d26934b3e1cb22256593b6bdbd03c553c26f4199a5bf05110642bc  zipstream_ng-1.8.0.tar.gz
+md5  eb08f32b64b28005d5d3846cf49aabd3  zipstream_ng-1.9.0.tar.gz
+sha256  a0d94030822d137efbf80dfdc680603c42f804696f41147bb3db895df667daea  zipstream_ng-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 289e03b10a..35e03d041b 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZIPSTREAM_NG_VERSION = 1.8.0
+PYTHON_ZIPSTREAM_NG_VERSION = 1.9.0
 PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/ac/16/5d9224baf640214255c34a0a0e9528c8403d2b89e2ba7df9d7cada58beb1
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/11/f2/690a35762cf8366ce6f3b644805de970bd6a897ca44ce74184c7b2bc94e7
 PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
