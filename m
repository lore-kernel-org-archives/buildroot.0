Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:06:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23BF60F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A23BF60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8025181A64;
	Sun, 26 Sep 2021 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfEkJcxMhkmE; Sun, 26 Sep 2021 20:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82A781A5C;
	Sun, 26 Sep 2021 20:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E296F1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2B940201
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cl7rvRAOQnTt for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 20:05:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C47A24028F
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 20:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 615908D2A7; Sun, 26 Sep 2021 20:02:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:56:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 548750a257381af6f59da45daa10c77cafe11461
X-Git-Newrev: da86ffbe307143315939ff5ea3a688c8a6cb6eef
X-Patchwork-Hint: ignore
Message-Id: <20210926200256.615908D2A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsaccel: bump to version
 0.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=da86ffbe307143315939ff5ea3a688c8a6cb6eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, add license file and corresponding hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-wsaccel/python-wsaccel.hash | 8 +++++---
 package/python-wsaccel/python-wsaccel.mk   | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index a02b5a8712..9d0002d41d 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2b4ea3d6847855c0587d37fca9db0557, sha256 locally computed.
-md5	2b4ea3d6847855c0587d37fca9db0557  wsaccel-0.6.2.tar.gz
-sha256	425706acf0724d2f6bfa391ec37b4ef121d3432c956029de3cea4e101c218e0c  wsaccel-0.6.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/wsaccel/json
+md5  973168711818dd98b8b28a4c2db77a27  wsaccel-0.6.3.tar.gz
+sha256  fdb27866bb6b6e7a29e45222778ff97938782a0ce92eff07dfb20af8fb9301c4  wsaccel-0.6.3.tar.gz
+# Locally computed sha256 checksums
+sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 016ff2d72a..7c78951f2f 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.2
+PYTHON_WSACCEL_VERSION = 0.6.3
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://pypi.python.org/packages/source/w/wsaccel
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/f5/d1/3e99875a764d0d6ec94a74977ed72dd3022a7f31d036622da9cff8fc072f
 PYTHON_WSACCEL_LICENSE = Apache-2.0
+PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
