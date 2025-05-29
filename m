Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F22C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE18583A08;
	Thu, 12 Jun 2025 08:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfWhHmz-r-Zk; Thu, 12 Jun 2025 08:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F344E83A05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F344E83A05;
	Thu, 12 Jun 2025 08:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ACC01BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DCB942115
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhKXIOAo9Kxf for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF5742124
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CF5742124
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ADF3817E6; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 00:11:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2688f40ffb83d1f5d03b4882517e0aa5c9a8ce71
X-Git-Newrev: 0c229c01be248316109a9118cf8c12fb614a41a8
X-Patchwork-Hint: ignore
Message-Id: <20250612083830.9ADF3817E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aerich: bump to version
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c229c01be248316109a9118cf8c12fb614a41a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index a2503f899e..bdbea8f66c 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  11cc31e2513118e66fc37c833cdeaac8  aerich-0.8.2.tar.gz
-sha256  0ed2b15bb017785d17323329e5448b4b12fcfec08a20932626c12aa59a8378d6  aerich-0.8.2.tar.gz
+md5  031a5946dcf816e8059459204eb63b65  aerich-0.9.0.tar.gz
+sha256  37c7ca71e947e7de3aa0e778cb193fc1faebf9136a0f1108b52b902918b85acc  aerich-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 8b54de755a..6c6cea2dfe 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.8.2
+PYTHON_AERICH_VERSION = 0.9.0
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/dc/d1/701a44d8f7fdccf700400ce16a26c679b3f4e36de9fb86c3d9f55f64b07f
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/2f/4b/1facb78fea47f790040035b94fdcc31630fabe1bda49ebc7a4f374da1757
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
